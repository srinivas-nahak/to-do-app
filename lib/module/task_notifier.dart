import 'dart:collection';

import 'package:flutter/foundation.dart';
import './task_data.dart';

class TaskNotifier extends ChangeNotifier {
  List<TaskData> _taskList = [
    TaskData(taskName: "Buy Paste"),
    TaskData(taskName: "Meditate"),
    TaskData(taskName: "Be Calm")
  ];

  int get taskLength => _taskList.length;

  UnmodifiableListView get taskList => UnmodifiableListView(_taskList);

  void addData(String task) {
    _taskList.add(TaskData(taskName: task));
    notifyListeners();
  }

  void updateTick(int index) {
    _taskList[index].toggleComplete();
    notifyListeners();
  }

  void removeItem(int index) {
    _taskList.removeAt(index);
    notifyListeners();
  }
}
