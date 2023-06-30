import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/module/task_notifier.dart';
import 'screens/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskNotifier>(
      create: (context) => TaskNotifier(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: TasksScreen(),
      ),
    );
  }
}
