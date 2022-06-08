import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_state.dart';

class TaskTile extends StatelessWidget {
  final bool checked;
  final String taskTitle;
  final int taskIndex;

  const TaskTile({
    Key? key,
    required this.checked,
    required this.taskTitle,
    required this.taskIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksState>(
      builder: (context, tasksState, child) {
        return ListTile(
          onLongPress: () {
            tasksState.deleteTask(taskIndex);
          },
          title: Text(
            taskTitle,
            style: TextStyle(
              decoration: checked ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Checkbox(
            value: checked,
            activeColor: Colors.lightBlueAccent,
            onChanged: (_) {
              tasksState.toggleTask(taskIndex);
            },
          ),
        );
      },
    );
  }
}
