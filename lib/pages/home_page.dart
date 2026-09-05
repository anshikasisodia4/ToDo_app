
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';
import 'add_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> tasks = [];

  void addTask(String title) {
    setState(() {
      tasks.add(
        Task(title: title),
      );
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Tasks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: tasks.isEmpty
          ? const Center(
              child: Text(
                'No tasks yet\nAdd a task to get started!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  task: tasks[index],
                  onDelete: () => deleteTask(index),
                  onToggle: () => toggleTask(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final task = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskPage(),
            ),
          );

          if (task != null && task is String && task.isNotEmpty) {
            addTask(task);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

