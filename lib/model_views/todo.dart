import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';
import 'package:uuid/uuid.dart';

class Todo with ChangeNotifier {
  // task list
  List<Task> task = <Task>[];

  // create a new task
  addTask(String title, {String? details, bool? status}) {
    const uuid = Uuid();
    final id = uuid.v1();

    task.add(Task(
        id: id,
        title: title,
        details: details,
        status: status == null ? false : true));
    notifyListeners();
  }

  // mark task as done and update state
  toggleStatus(String id) {
    final index = task.indexWhere((element) => element.id == id);
    if (index != -1) {
      task[index] = Task(
          id: id,
          title: task[index].title,
          details: task[index].details,
          status: !task[index].status);
      notifyListeners();
    }
  }

  // remove task from the task list
  removeTask(String id) {
    final index = task.indexWhere((element) => element.id == id);
    if (index != -1) {
      task.removeAt(index);
      notifyListeners();
    }
  }
}
