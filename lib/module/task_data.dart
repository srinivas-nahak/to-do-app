class TaskData {
  TaskData({required this.taskName, this.isDone = false});

  String taskName;
  bool isDone;

  toggleComplete() {
    isDone = !isDone;
  }
}
