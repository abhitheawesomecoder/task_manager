import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/model_views/todo.dart';

class ListTask extends StatefulWidget {
  const ListTask({super.key, required this.title});

  final String title;
  @override
  State<ListTask> createState() => _ListTask();
}

class _ListTask extends State<ListTask> {
  @override
  Widget build(BuildContext context) {
    final taskList = Provider.of<Todo>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: taskList.task.length,
          //display task
          itemBuilder: ((context, index) => ListTile(
                leading: Checkbox(
                  // mark task done
                  value: taskList.task[index].status,
                  onChanged: ((_) =>
                      taskList.markDone(taskList.task[index].id)),
                ),
                title: Text(taskList.task[index].title),
                trailing: IconButton(
                    onPressed: () {
                      //delete task
                      taskList.removeTask(taskList.task[index].id);
                    },
                    icon: const Icon(Icons.delete)),
              )),
        ),
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
