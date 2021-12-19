import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:db_and_provider/todo/db/todo_table.dart';

class TodoDatabase {
  static String DB_NAME = 'my_todo1.db'; // <---
  static int VERSION = 1;
  static late Database _database;

  final List<String> _createTableScripts = [
    TodoTable.CREATE_TABLE,
  ];
  final List<String> _dropTableScripts = [
    TodoTable.DROP_TABLE,
  ];

  TodoDatabase._internal();

  init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      version: VERSION,
      onCreate: (Database db, int version) {
        _createTableScripts.forEach((script) async {
          await db.execute(script);
          print('create db success!');
        });
      },
      onUpgrade: (db, oldVersion, newVersion) {
        _dropTableScripts.forEach((script) async {
          await db.execute(script);
        });
      },
    );
  }

  Database get myDatabase => _database;
  static TodoDatabase get myInstance => TodoDatabase._internal();
}
