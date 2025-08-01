import 'package:flutter/cupertino.dart';
import 'package:to_do_app/taskItem.dart';

class ToDoProvider with ChangeNotifier{

  List<TaskItem> allTask = [];

  List<TaskItem> getAllTask() => allTask;

  void addNewTask({required TaskItem task}){
    task = TaskItem(id: allTask.length, title: task.title, description: task.description);

    allTask.add(task);
    notifyListeners();
  }

  void removeTask({required TaskItem task}){
    allTask.remove(task);
    notifyListeners();
  }

  void updateTask({required TaskItem task}){
    if(task.id >= 0 || task.id < allTask.length){
      allTask[task.id] = task;
      notifyListeners();
    }
  }



  // void updateTask({required TaskItem task}) {
  //   final index = allTask.indexWhere((t) => t.id == task.id);
  //   if (index != -1) {
  //     allTask[index] = task;
  //     notifyListeners();
  //   }
  // }

}