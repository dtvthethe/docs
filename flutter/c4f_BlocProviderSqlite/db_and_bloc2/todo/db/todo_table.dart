import 'package:sqflite/sqlite_api.dart';
import 'package:db_and_provider/todo/model/todo.dart';
import 'package:db_and_provider/todo/db/todo_database.dart';

class TodoTable {
  static String TABLE_NAME = 'todos';
  final Database db = TodoDatabase.myInstance.myDatabase;

  static String CREATE_TABLE = '''
    CREATE TABLE IF NOT EXISTS $TABLE_NAME (
      id INTEGER PRIMARY KEY,
      name TEXT
    );
  ''';
  static String DROP_TABLE = '''
    DROP TABLE IF EXISTS $TABLE_NAME;
  ''';

  Future<int> insert(Todo todo) async {
    return await db.insert(
      TABLE_NAME,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Todo>> get() async {
    List<Map<String, Object?>> result = await db.query(TABLE_NAME);

    return List<Todo>.generate(result.length, (index) {
      int id = int.parse(result[index]['id'].toString());
      String name = result[index]['name'].toString();
      return Todo.fromMap(id, name);
    });
  }

  Future<int> delete(int id) async {
    return await db.delete(TABLE_NAME, where: 'id = ?', whereArgs: [id]);
  }
}
