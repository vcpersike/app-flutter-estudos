class Task {
  final String id;
  final String title;
  final String description;
  TaskStatus status;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.status = TaskStatus.pending,
  });
}

enum TaskStatus { pending, inProgress, done }
