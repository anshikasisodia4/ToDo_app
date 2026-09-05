import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class TaskStorage {
  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> data = tasks.map((task) {
      return jsonEncode({
        'name': task.name,
        'isDone': task.isDone,
      });
    }).toList();

    await prefs.setStringList('tasks', data);
  }

  static Future<List<Task>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> data = prefs.getStringList('tasks') ?? [];

    return data.map((item) {
      final task = jsonDecode(item);

      return Task(
        name: task['name'],
        isDone: task['isDone'],
      );
    }).toList();
  }
}