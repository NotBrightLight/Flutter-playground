import 'package:get/get.dart';
import 'package:productivity/db/db_helper.dart';
import 'package:productivity/models/task.dart';

class TaskController extends GetxController {
  final RxList<Task> taskList = <Task>[].obs;

  @override
  void onReady() {
    super.onReady();
    _loadTasks();
  }

  // Add a new task to the database
  Future<int> addTask(Task task) async {
    final id = await DBHelper.insert(task);
    _loadTasks();
    return id;
  }

  // Load all tasks from the database
  void _loadTasks() async {
    final List<Map<String, dynamic>> tasks = await DBHelper.query();
    final List<Task> taskItems = tasks.map((data) => Task.fromJson(data)).toList();
    taskList.assignAll(taskItems);
  }

  // Delete a task from the database
  Future<void> deleteTask(Task task) async {
    await DBHelper.delete(task);
    _loadTasks();
  }

  // Mark a task as completed and update it in the database
  Future<void> markTaskCompleted(int id) async {
    await DBHelper.updateTaskStatus(id, 1);
    _loadTasks();
  }
}
