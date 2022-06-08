import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_state.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksState>(
      builder: (context, tasksState, child) {
        return ListView.builder(
          itemCount: tasksState.taskCount,
          itemBuilder: (context, index) {
            final currentTask = tasksState.tasks[index];

            return TaskTile(
              checked: currentTask.isDone,
              taskTitle: currentTask.name,
              taskIndex: index,
            );
          },
        );
      },
    );
  }
}
