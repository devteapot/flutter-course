import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    Key? key,
    required this.onAddTask,
  }) : super(key: key);

  final void Function(String taskName) onAddTask;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final taskNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    taskNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30.0,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            controller: taskNameController,
          ),
          TextButton(
            onPressed: () {
              widget.onAddTask(taskNameController.text);
            },
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.lightBlueAccent,
            ),
            child: const Text('Add'),
          )
        ],
      ),
    );
  }
}
