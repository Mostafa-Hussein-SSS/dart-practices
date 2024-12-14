class Task {
  final int id;
  final String title;
  bool isCompleted;

  Task(this.id, this.title, {this.isCompleted = false});

  void complete() {
    isCompleted = true;
  }

  @override
  String toString() {
    return "[${isCompleted ? '✓' : ' '}] Task #$id: $title";
  }
}

class PriorityTask extends Task {
  final String priority; // low, medium, high

  PriorityTask(int id, String title, this.priority) : super(id, title);

  @override
  String toString() {
    return "[${isCompleted ? '✓' : ' '}] Priority Task #$id ($priority): $title";
  }
}
