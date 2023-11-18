import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';
import 'package:uuid/uuid.dart';

class Todo with ChangeNotifier {
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
  }

  // mark task as done and update state
  markDone(String id) {}
  // remove task from the task list
  removeTask(String id) {}
}
