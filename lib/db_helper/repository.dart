import 'package:sqlflite_crud/db_helper/connection.dart';
import 'package:sqlflite_crud/db_helper/tables.dart';
import 'package:sqlflite_crud/models/todos.dart';

class Repository {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  //Get Todos
  Future<List<Todos>> getTodos() async {
    final db = await databaseHelper.initDatabase();
    final List<Map<String, Object?>> todos =
        await db.query(Tables.todoTableName);
    return todos.map((e) => Todos.fromMap(e)).toList();
  }

  // Add Todo
  Future<int> addTodo(Todos todos) async {
    final db = await databaseHelper.initDatabase();
    return db.insert(Tables.todoTableName, todos.toMap());
  }

  // Update Todo
  Future<int> updateTodo(Todos todos) async {
    final db = await databaseHelper.initDatabase();
    return db.update(Tables.todoTableName, todos.toMap(),
        where: "todoId = ?", whereArgs: [todos.todoId]);
  }

  //Delete Todo
  Future<int> deleteTodo(int id) async {
    final db = await databaseHelper.initDatabase();
    return db.delete(Tables.todoTableName, where: "todoId =?", whereArgs: [id]);
  }

  //Get Todo By ID
  Future<Todos> getTodoById(int id) async {
    final db = await databaseHelper.initDatabase();
    final todo = await db
        .query(Tables.todoTableName, where: "todoId = ?", whereArgs: [id]);
    if (todo.isNotEmpty) {
      return Todos.fromMap(todo.first);
    } else {
      throw Exception("Note $id not found");
    }
  }
}
