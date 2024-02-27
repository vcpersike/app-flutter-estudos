import 'package:estudos/models/task_model.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.description),
        trailing: Icon(Icons.drag_handle),
      ),
    );
  }
}
