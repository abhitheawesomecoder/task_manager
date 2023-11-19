import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/model_views/todo.dart';
import 'package:task_manager/views/components/delete_dialog.dart';
import 'package:task_manager/views/components/view_dialog.dart';

class TaskList extends StatelessWidget {
  final Todo taskList;

  const TaskList({super.key, required this.taskList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskList.task.length,
      //display task
      itemBuilder: ((context, index) => ListTile(
            leading: Checkbox(
              // mark task done
              value: taskList.task[index].status,
              onChanged: ((_) =>
                  taskList.toggleStatus(taskList.task[index].id)),
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
                  onTap: () => taskList.task[index].details != null
                      ? viewDialog(context, taskList.task[index].details!)
                      : ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('No Details Available')),
                        ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: const Row(children: [
                    Icon(Icons.delete_outline),
                    SizedBox(width: 10),
                    Text('Delete')
                  ]),
                  onTap: () => deleteDiaolge(context, taskList.task[index].id),
                ),
              ],
            ),
          )),
    );
  }
}
