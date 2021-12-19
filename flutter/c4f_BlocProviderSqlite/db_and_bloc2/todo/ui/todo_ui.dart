import 'package:flutter/material.dart';
import 'package:db_and_provider/todo/ui/todo_header.dart';
import 'package:db_and_provider/todo/ui/todo_listview.dart';

class TodoUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          TodoHeader(),
          Expanded(child: TodoListView()),
        ],
      ),
    );
  }
}
