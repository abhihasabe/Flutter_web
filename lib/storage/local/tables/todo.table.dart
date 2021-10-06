class TodoTable {
  static final String tableName = 'todo';
  static final String columnId = '_id';
  static final String columnTitle = 'title';

  int? id;
  String? title;

  Map toJson() => {
    columnId: id,
    columnTitle: title
  };

  static List<TodoTable> fromJsonList(List<dynamic> json) => json.map((i) => TodoTable.fromJson(i)).toList();

  TodoTable.fromJson(Map<String, dynamic> json) {
    id = json[columnId];
    title = json[columnTitle];
  }

  TodoTable.fromMap(Map<dynamic, dynamic?> map) {
    id = map[columnId];
    title = map[columnTitle];
  }

  static String create() {
    return "CREATE TABLE $tableName (" +
      "$tableName INTEGER PRIMARY KEY " +
      "$columnTitle TEXT" +
    ")";
  }

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnTitle: title,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  TodoTable();
}
