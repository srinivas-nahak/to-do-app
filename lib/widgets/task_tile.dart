import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/module/task_notifier.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {required this.taskName,
      this.isDone = false,
      required this.onTick,
      super.key});

  final bool isDone;

  final String taskName;

  final ValueChanged<bool?> onTick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskName,
        style: TextStyle(
            fontSize: 22,
            decoration: isDone ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          value: isDone,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          activeColor: Colors.lightBlueAccent,
          onChanged: onTick),
      dense: true,
    );
  }
}
