import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> tasks = [];

  TextEditingController controller = TextEditingController();

  // Add Task
  void addTask() {
    if (controller.text.isEmpty) return;

    setState(() {
      tasks.add({
        'name': controller.text,
        'done': false,
      });
    });

    controller.clear();
    Navigator.pop(context);
  }

  // Delete Task
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  // Edit Task
  void editTask(int index) {
    controller.text = tasks[index]['name'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: TextField(
            controller: controller,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (controller.text.isEmpty) return;

                setState(() {
                  tasks[index]['name'] = controller.text;
                });

                controller.clear();
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  // Add Task Dialog
  void showAddTask() {
    controller.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Enter task',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: addTask,
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do App'),
      ),

      body: tasks.isEmpty
          ? const Center(
              child: Text('No Tasks'),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: tasks[index]['done'],
                    onChanged: (value) {
                      setState(() {
                        tasks[index]['done'] = value;
                      });
                    },
                  ),

                  title: Text(
                    tasks[index]['name'],
                    style: TextStyle(
                      decoration: tasks[index]['done']
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => editTask(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => deleteTask(index),
                      ),
                    ],
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: showAddTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}