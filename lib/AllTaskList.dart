import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/AddNewTask.dart';
import 'package:to_do_app/ToDoProvider.dart';
import 'package:to_do_app/taskItem.dart';

class AllTaskList extends StatelessWidget {
  const AllTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProviders = Provider.of<ToDoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("To Do App"),
      ),

      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => AddNewTask()),
          );
        },
        child: Icon(Icons.add),
      ),

      body: EmptyTaskList(listLength: taskProviders.getAllTask().length) ??
          ListView.builder(
            itemCount: taskProviders.getAllTask().length,
            itemBuilder: (context, index) => taskItem(
              task: taskProviders.getAllTask()[index],
              onPressedDelete: () {
                taskProviders.removeTask(
                  task: taskProviders.getAllTask()[index],
                );
              },
            ),
          ),
    );
  }

  Widget taskItem({
    required TaskItem task,
    required Function() onPressedDelete,
  }) {
    return Card(
      margin: EdgeInsets.only(top: 16, right: 16, left: 16),

      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          subtitleTextStyle: TextStyle(fontSize: 16, color: Colors.black),

          title: Text(task.title),
          subtitle: Padding(

              padding:EdgeInsets.only(top: 10),
              child: Text(task.description)),

          trailing: IconButton(
            onPressed: onPressedDelete,
            icon: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }

  Widget? EmptyTaskList({required int listLength}) {
    if (listLength > 0) {
      return null;
    }

    return Center(child: Text("Add a task"));
  }

}
