import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:db_and_provider/todo/ui/todo_header.dart';
import 'package:db_and_provider/todo/bloc/todo_bloc.dart';
import 'package:db_and_provider/todo/ui/todo_listview.dart';

class TodoUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Provider<TodoBloc>(
        create: (context) => TodoBloc(),
        child: Column(
          children: [
            TodoHeader(),
            Expanded(child: TodoListView()),
          ],
        ),
      ),
    );
  }
}
