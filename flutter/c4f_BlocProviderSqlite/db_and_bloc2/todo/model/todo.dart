class Todo {
  late int id;
  late String name;

  Todo({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Todo.fromMap(int id, String name) {
    return Todo(id: id, name: name);
  }
}
