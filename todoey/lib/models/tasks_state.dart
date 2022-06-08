import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TasksState extends ChangeNotifier {
  final List<Task> _tasks = [];

  void addTask(String taskName) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void toggleTask(int taskIndex) {
    _tasks[taskIndex].toggleTask();
    notifyListeners();
  }

  void deleteTask(int taskIndex) {
    _tasks.removeAt(taskIndex);
    notifyListeners();
  }

  List<Task> get tasks => _tasks;
  int get taskCount => _tasks.length;
}
