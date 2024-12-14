import 'dart:io';

import 'tasks/task_manager.dart';

class StateTaskManager extends TaskManager {
  final List<String> _log = [];

  void logAction(String action) {
    _log.add(action);
  }

  void showLogs() {
    print("\nAction Logs:");
    _log.forEach((log) => print(log));
  }

  @override
  void addTask(String title, {String? priority}) {
    super.addTask(title, priority: priority);
    logAction("Added task: $title");
  }

  @override
  void deleteTask(int id) {
    super.deleteTask(id);
    logAction("Deleted task #$id");
  }
}

void main() {
  final manager = StateTaskManager();

  while (true) {
    print("\n--- State Management Task Manager ---");
    print("1. Add Task");
    print("2. List Tasks");
    print("3. View Logs");
    print("4. Exit");
    stdout.write("Choose an option: ");
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Enter task title: ");
        final title = stdin.readLineSync()!;
        manager.addTask(title);
        break;

      case '2':
        manager.listTasks();
        break;

      case '3':
        manager.showLogs();
        break;

      case '4':
        print("Exiting State Task Manager. Goodbye!");
        return;

      default:
        print("Invalid choice. Please try again.");
    }
  }
}
