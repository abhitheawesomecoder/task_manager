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
          actions: const [
            Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.done_all_outlined))
          ],
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
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'view',
                      child: const Row(
                        children: [
                          Icon(Icons.info_outline),
                          SizedBox(width: 10),
                          Text('View')
                        ],
                      ),
                      onTap: () => Navigator.pushNamed(context, '/create_task'),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: const Row(children: [
                        Icon(Icons.delete_outline),
                        SizedBox(width: 10),
                        Text('Delete')
                      ]),
                      onTap: () => {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Confirm Delete'),
                                content: const Text(
                                  'Are you sure you want to delete this task?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // BlocProvider.of<InvoiceCubit>(
                                      //         context,
                                      //         listen: false)
                                      //     .deleteItemById(
                                      //         token, item.id);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ],
                              );
                            })
                      },
                    ),
                  ],
                  onSelected: (value) {
                    if (value == 'edit') {
                      // Implement edit item functionality
                    } else if (value == 'delete') {
                      // Implement delete item functionality
                    }
                  },
                ),
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
