import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/model_views/todo.dart';
import 'package:task_manager/views/create_task.dart';
import 'package:task_manager/views/list_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: ((context) => Todo()),
        child: MaterialApp(
          title: 'Task Manager',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const ListTask(title: 'Task List'),
            '/create_task': (context) => const CreateTask(title: 'Create Task')
          },
        ));
  }
}
