import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/AddNewTask.dart';
import 'package:to_do_app/ToDoProvider.dart';
import 'package:to_do_app/taskItem.dart';

class AllTaskList extends StatelessWidget {
    AllTaskList({super.key});



  @override
  Widget build(BuildContext context) {
    final taskProviders = Provider.of<ToDoProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("To Do App")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => AddNewTask()),
          );
        },
        child: Icon(Icons.add),
      ),

      body:
      emptyTaskList(listLength: taskProviders
          .getAllTask()
          .length) ??
          ListView.builder(
            itemCount: taskProviders
                .getAllTask()
                .length,
            itemBuilder: (context, index) =>
                taskItem(
                  task: taskProviders.getAllTask()[index],
                  context: context,
                  onPressEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => AddNewTask(task:taskProviders.getAllTask()[index],)),
                    );
                  },
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
    required BuildContext context,
    required Function() onPressEdit,
    required Function() onPressedDelete,
  }) {
    var theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.only(top: 16, right: 16, left: 16),

      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      child: Slidable(
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                backgroundColor: theme.colorScheme.tertiaryContainer,
                foregroundColor: theme.colorScheme.onTertiaryContainer,
                flex: 2,
                onPressed: (_) => {onPressEdit()},
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
          ),

          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                backgroundColor: theme.colorScheme.error,
                foregroundColor: theme.colorScheme.onError,
                flex: 2,
                onPressed: (_) => {onPressedDelete()},
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),

          child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(

       leading: CircleAvatar(
         radius: 24,
         child: Text(task.id.toString()),
       ) ,
      title: Text(task.title),
      subtitle: Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(task.description),
      ),

      ),
      )
      ,
      ),
    );
  }

  Widget? emptyTaskList({required int listLength}) {
    if (listLength > 0) {
      return null;
    }

    return Center(child: Text("Add a task"));
  }
}
