import 'dart:io';

import 'async_task_manager.dart' as asyncTask;
import 'oop_task_manager.dart' as oop;
import 'state_task_manager.dart' as state;

void main() {
  while (true) {
    print("\n--- Dart Task Manager Hub ---");
    print("Choose a CLI Tool to Run:");
    print("1. OOP Task Manager");
    print("2. Async Task Manager");
    print("3. State Management Task Manager");
    print("4. Exit");
    stdout.write("Enter your choice: ");
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        oop.main(); // Call OOP Task Manager
        break;
      case '2':
        asyncTask.main(); // Call Async Task Manager
        break;
      case '3':
        state.main(); // Call State Management Task Manager
        break;
      case '4':
        print("Exiting the Task Manager Hub. Goodbye!");
        return;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}
