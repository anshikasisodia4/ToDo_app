import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String task;
  final bool isDone;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final ValueChanged<bool?> onChanged;

  const TaskCard({
    super.key,
    required this.task,
    required this.isDone,
    required this.onDelete,
    required this.onEdit,
    required this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(value: isDone, onChanged: onChanged),
        title: Text(
          task,
          style: TextStyle(
            decoration: isDone
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: const Icon(Icons.edit), onPressed: onEdit),
            IconButton(icon: const Icon(Icons.delete), onPressed: onDelete),
          ],
        ),
      ),
    );
  }
}
