import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/ToDoProvider.dart';
import 'package:to_do_app/taskItem.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({super.key});

  @override
  Widget build(BuildContext context) {

    final taskProvider = Provider.of<ToDoProvider>(context);
    final formKey = GlobalKey<FormState>();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Form(
      key: formKey,
      child:  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          foregroundColor: Colors.white,
          title: Text("New Task"),
        ),

        body: Center(
          child: Column(

            children: [

              SizedBox(height: 120,),

              taskTextField(
                label: "title",
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Something";
                  }
                  return null;
                },
              ),


              taskTextField(
                label: "description",
                controller: descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Something";
                  }
                  return null;
                },
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  foregroundColor: Colors.white,
                ),

                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    taskProvider.addNewTask(
                      task: TaskItem(
                        title: titleController.text,
                        description: descriptionController.text,
                      ),
                    );

                    Navigator.pop(context);
                  }
                },
                child: Text("Save", style: TextStyle(fontSize: 18),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget taskTextField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
