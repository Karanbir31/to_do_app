import 'package:flutter/cupertino.dart';
import 'package:to_do_app/taskItem.dart';

class ToDoProvider with ChangeNotifier{

  List<TaskItem> allTask = [];

  List<TaskItem> getAllTask() => allTask;

  void addNewTask({required TaskItem task}){
    allTask.add(task);
    notifyListeners();
  }

  void removeTask({required TaskItem task}){
    allTask.remove(task);
    notifyListeners();
  }
  void updateTask({required TaskItem task,required int index}){
    allTask[index] = task;
    notifyListeners();
  }



}