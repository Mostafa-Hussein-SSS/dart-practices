import 'task.dart';

class TaskManager {
  final List<Task> _tasks = [];
  int _nextId = 1;

  void addTask(String title, {String? priority}) {
    if (priority != null) {
      _tasks.add(PriorityTask(_nextId++, title, priority));
    } else {
      _tasks.add(Task(_nextId++, title));
    }
    print("Task added successfully!");
  }

  void listTasks() {
    if (_tasks.isEmpty) {
      print("No tasks available.");
    } else {
      _tasks.forEach((task) => print(task));
    }
  }

  void completeTask(int id) {
    final task = _tasks.firstWhere((t) => t.id == id,
        orElse: () => throw Exception("Task not found!"));
    task.complete();
    print("Task #$id marked as completed!");
  }

  void deleteTask(int id) {
    _tasks.removeWhere((t) => t.id == id);
    print("Task #$id deleted successfully!");
  }
}
