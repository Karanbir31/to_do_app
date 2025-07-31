import 'package:flutter/cupertino.dart';
import 'package:to_do_app/taskItem.dart';

class ToDoProvider with ChangeNotifier{

  List<TaskItem> allTask = [];

  List<TaskItem> getAllTask() => allTask;

  void addNewTask({required TaskItem task}){
    allTask.add(task);
    notifyListeners();
  }

}