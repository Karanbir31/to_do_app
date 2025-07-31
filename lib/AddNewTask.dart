import 'package:flutter/material.dart';
import 'package:to_do_app/ToDoProvider.dart';
import 'package:to_do_app/taskItem.dart';

class AddNewTask extends StatelessWidget {
  AddNewTask({super.key});

  final formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(child: MaterialApp(
      home: Center(
        child: Column(
          children: [

            taskTextField(label: "title",
                controller: titleController,
                validator: (value) {
                  return null;
                }),

            taskTextField(label: "description",
                controller: descriptionController,
                validator: (value) {
                  return null;
                }),

            ElevatedButton(onPressed: () {
              ToDoProvider().addNewTask(task: TaskItem(
                  title: titleController.text,
                  description: descriptionController.text)
              );
            }, child: Text("Save"))
          ],
        ),
      ),
    ));
  }


  Widget taskTextField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder()
      ),
    );
  }
}
