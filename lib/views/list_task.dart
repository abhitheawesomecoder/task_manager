import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/model_views/todo.dart';
import 'package:task_manager/views/components/task_list.dart';

class ListTask extends StatelessWidget {
  const ListTask({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final taskList = Provider.of<Todo>(context);
    return Scaffold(
        appBar: AppBar(
          // actions: const [
          //   Padding(
          //       padding: EdgeInsets.only(right: 20),
          //       child: Icon(Icons.done_all_outlined))
          // ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: TaskList(taskList: taskList),
        bottomNavigationBar: Container(
            color: Theme.of(context).colorScheme.inversePrimary,
            alignment: Alignment.center,
            height: 50.0,
            child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/create_task'),
                child: const Text(
                  'Create Task',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ))));
  }
}
