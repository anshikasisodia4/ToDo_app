import 'package:flutter/material.dart';

class TaskDialog extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;

  const TaskDialog({
    super.key,
    required this.controller,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Task'),

      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'Enter task',
          border: OutlineInputBorder(),
        ),
      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),

        ElevatedButton(
          onPressed: onAdd,
          child: const Text('Add'),
        ),
      ],
    );
  }
}