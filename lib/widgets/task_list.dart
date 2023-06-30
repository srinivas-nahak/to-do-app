import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/module/task_data.dart';
import 'package:to_do_app/module/task_notifier.dart';
import './task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskNotifier>(builder: (context, taskProvider, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final TaskData currentTask = taskProvider.taskList[index];

          return GestureDetector(
            onLongPress: () {
              if (currentTask.isDone) {
                taskProvider.removeItem(index);
              } else {
                showModalBottomSheet(
                    context: context,
                    barrierColor: Colors.transparent,
                    builder: (context) {
                      return Container(
                        height: 80,
                        alignment: Alignment.center,
                        width: double.infinity,
                        color: Colors.red,
                        child: Text("Please mark as complete first!"),
                      );
                    });

                Future.delayed(Duration(milliseconds: 1500)).then(
                  (value) => Navigator.pop(context),
                );
              }
            },
            child: TaskTile(
              taskName: currentTask.taskName,
              isDone: currentTask.isDone,
              onTick: (bool? isDone) {
                taskProvider.updateTick(index);
              },
            ),
          );
        },
        itemCount: taskProvider.taskList.length,
      );
    });
  }
}
