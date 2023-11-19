import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model_views/todo.dart';

dynamic deleteDiaolge(context, id) {
  return showDialog(
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
                Provider.of<Todo>(context, listen: false).removeTask(id);
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      });
}
