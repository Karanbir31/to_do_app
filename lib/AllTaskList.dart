import 'package:flutter/material.dart';
import 'package:to_do_app/taskItem.dart';

class AllTaskList extends StatelessWidget {
  const AllTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget taskItem({required TaskItem task, required Function() onPressedDelete}) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),

      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(),
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          ListTile(
            title: Text(
              task.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              task.description,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            trailing: IconButton(onPressed: onPressedDelete, icon: Icon(Icons.delete)),

          ),
        ],
      ),
    );
  }
}
