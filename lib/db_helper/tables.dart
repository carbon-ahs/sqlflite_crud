class Tables {
  static String todoTableName = "todos";

  static String todoTable = '''
  CREATE TABLE IF NOT EXISTS $todoTableName(
  todoId INTEGER PRIMARY KEY AUTOINCREMENT,
  headings TEXT,
  details TEXT,
  dueDate TEXT,
  createdAt TEXT  
  )''';
}
