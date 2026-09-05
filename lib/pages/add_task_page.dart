import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void saveTask() {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();

    if (title.isNotEmpty) {
      Navigator.pop(context, {
        'title': title,
        'description': description,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Task',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Task Title',
                hintText: 'Enter your task',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.task_alt),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Enter task details (optional)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description_outlined),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: saveTask,
                child: const Text(
                  'Add Task',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
