import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class TasksData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Bread'),
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask({String taskTittle}) {
    _tasks.add(Task(name: taskTittle));
    notifyListeners();
  }

  void deleteTask({int index}) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleTaskState(Task task) {
    task.toggleTaskState();
    notifyListeners();
  }

  int get taskCount => _tasks.length;
}
