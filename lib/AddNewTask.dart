import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/ToDoProvider.dart';
import 'package:to_do_app/taskItem.dart';

class AddNewTask extends StatelessWidget {
  final TaskItem? task;

  const AddNewTask({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var buttonText = "Save";
    final taskProvider = Provider.of<ToDoProvider>(context);
    final formKey = GlobalKey<FormState>();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();


    if(task !=null){
      titleController.text = task!.title;
      descriptionController.text = task!.description;
      buttonText = "Update";
    }

    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(title: Text("New Task")),

        body: Center(
          child: Column(
            children: [
              SizedBox(height: 120),

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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if(task != null){
                      taskProvider.updateTask(task: TaskItem(id: task!.id, title: titleController.text, description: descriptionController.text));

                    }else{
                      taskProvider.addNewTask(
                        task: TaskItem(
                          id: 0,
                          title: titleController.text,
                          description: descriptionController.text,
                        ),
                      );
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(buttonText, style: TextStyle(fontSize: 18)),
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
