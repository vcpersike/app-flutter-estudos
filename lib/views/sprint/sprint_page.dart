import 'package:estudos/components/task_card.dart';
import 'package:estudos/models/task_model.dart';
import 'package:flutter/material.dart';

class SprintPage extends StatefulWidget {
  const SprintPage({Key? key}) : super(key: key);

  @override
  _SprintPageState createState() => _SprintPageState();
}

class _SprintPageState extends State<SprintPage> {
  List<Task> pendingTasks = [
    Task(id: '1', title: 'Task 1', description: 'Description 1'),
    // Adicione mais tarefas iniciais conforme necessário
  ];

  List<Task> inProgressTasks = [];
  List<Task> doneTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sprint'),
      ),
      body: Row(
        children: [
          Expanded(child: TaskColumn(tasks: pendingTasks, title: 'Pendente')),
          Expanded(child: TaskColumn(tasks: inProgressTasks, title: 'Em Andamento')),
          Expanded(child: TaskColumn(tasks: doneTasks, title: 'Concluído')),
        ],
      ),
    );
  }
}

class TaskColumn extends StatelessWidget {
  final List<Task> tasks;
  final String title;

  const TaskColumn({Key? key, required this.tasks, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.headline6),
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) => TaskCard(task: tasks[index]),
          ),
        ),
      ],
    );
  }
}
