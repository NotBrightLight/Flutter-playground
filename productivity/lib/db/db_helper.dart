import 'package:sqflite/sqflite.dart';
import 'package:productivity/models/task.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'tasks';

  // Initialize the database
  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String path = join(await getDatabasesPath(), 'tasks.db');
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) async {
          await db.execute(
            '''CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            title TEXT, 
            note TEXT, 
            date TEXT, 
            startTime TEXT, 
            endTime TEXT, 
            remind INTEGER, 
            repeat TEXT, 
            color INTEGER, 
            isCompleted INTEGER)''',
          );
        },
      );
    } catch (e) {
      print("Error initializing database: $e");
    }
  }

  // Insert a task into the database
  static Future<int> insert(Task task) async {
    if (_db == null) {
      await initDb();
    }
    print("Inserting task into database");
    return await _db!.insert(_tableName, task.toJson());
  }

  // Delete a task by id
  static Future<int> delete(Task task) async {
    if (_db == null) {
      await initDb();
    }
    return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [task.id]);
  }

  // Query all tasks from the database
  static Future<List<Map<String, dynamic>>> query() async {
    if (_db == null) {
      await initDb();
    }
    print("Fetching tasks from database");
    return await _db!.query(_tableName);
  }

  // Update the task as completed
  static Future<int> updateTaskStatus(int id, int isCompleted) async {
    if (_db == null) {
      await initDb();
    }
    print("Updating task status to completed");
    return await _db!.rawUpdate(
      'UPDATE $_tableName SET isCompleted = ? WHERE id = ?',
      [isCompleted, id],
    );
  }
}
