import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/model_views/todo.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key, required this.title});

  final String title;

  @override
  State<CreateTask> createState() => _CreateTask();
}

class _CreateTask extends State<CreateTask> {
  final _formKey = GlobalKey<FormState>();
  final taskTitleController = TextEditingController();
  final taskDetailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    taskTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
          child: Card(
            child: Container(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
              width: width - 40,
              height: height / 2,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Task Title",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      controller: taskTitleController,
                      maxLength: 30,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter task title';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Task Detail",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                        maxLines: 5,
                        controller: taskDetailController,
                        maxLength: 150,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Provider.of<Todo>(context, listen: false)
                                  .addTask(taskTitleController.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Task Created Successfully')),
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Create'),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
