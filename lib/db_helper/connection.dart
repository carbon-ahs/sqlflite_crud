import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlflite_crud/db_helper/tables.dart';

class DatabaseHelper {
  final databaseName = "todo.db";

  Future<Database> initDatabase() async {
    final databasePath = await getApplicationDocumentsDirectory();
    final path = join(databasePath.path, databaseName);
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      //Tables to execute
      await db.execute(Tables.todoTable);
    });
  }
}
