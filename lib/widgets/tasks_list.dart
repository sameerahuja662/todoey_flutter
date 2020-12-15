import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(builder: (context, taskData, child) {
      return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              tittle: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              toggleTaskState: (bool isChecked) {
                taskData.toggleTaskState(taskData.tasks[index]);
              },
              deleteTask: () {
                taskData.deleteTask(index: index);
              },
            );
          },
          itemCount: taskData.taskCount);
    });
  }
}
