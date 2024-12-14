import 'dart:async';
import 'dart:io';

import 'tasks/task_manager.dart';

class AsyncTaskManager extends TaskManager {
  Future<void> addTaskAsync(String title, {String? priority}) async {
    await Future.delayed(Duration(milliseconds: 200));
    addTask(title, priority: priority);
  }

  Future<void> completeTaskAsync(int id) async {
    await Future.delayed(Duration(milliseconds: 200));
    completeTask(id);
  }
}

void main() async {
  final manager = AsyncTaskManager();

  while (true) {
    print("\n--- Async Task Manager ---");
    print("1. Add Task");
    print("2. List Tasks");
    print("3. Complete Task");
    print("4. Delete Task");
    print("5. Exit");
    stdout.write("Choose an option: ");
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Enter task title: ");
        final title = stdin.readLineSync()!;
        stdout.write("Is this a priority task? (yes/no): ");
        final isPriority = stdin.readLineSync()!.toLowerCase() == 'yes';
        if (isPriority) {
          stdout.write("Enter priority (low/medium/high): ");
          final priority = stdin.readLineSync()!;
          await manager.addTaskAsync(title, priority: priority);
        } else {
          await manager.addTaskAsync(title);
        }
        break;

      case '2':
        manager.listTasks();
        break;

      case '3':
        stdout.write("Enter task ID to mark as complete: ");
        final id = int.parse(stdin.readLineSync()!);
        try {
          await manager.completeTaskAsync(id);
        } catch (e) {
          print(e);
        }
        break;

      case '4':
        stdout.write("Enter task ID to delete: ");
        final id = int.parse(stdin.readLineSync()!);
        manager.deleteTask(id);
        break;

      case '5':
        print("Exiting Async Task Manager. Goodbye!");
        return;

      default:
        print("Invalid choice. Please try again.");
    }
  }
}
