import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:db_and_provider/todo/model/todo.dart';
import 'package:db_and_provider/todo/bloc/todo_bloc.dart';
import 'package:db_and_provider/todo/event/query_event.dart';
import 'package:db_and_provider/todo/event/remove_event.dart';

class TodoListView extends StatefulWidget {
  @override
  _TodoListViewState createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  late TodoBloc todoBloc;

  @override
  void didChangeDependencies() {
    todoBloc = Provider.of<TodoBloc>(context);
    todoBloc.mySream.add(QueryEvent()); // <---
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Todo>>(
      stream: todoBloc.lstTodoController.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) => Dismissible(
              key: Key(snapshot.data![index].id.toString()),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 2,
                ),
                child: Text(snapshot.data?[index].name ?? ''),
              ),
              background: Container(
                color: Colors.redAccent,
              ),
              onDismissed: (direction) {
                todoBloc.mySream.add(RemoveEvent(id: snapshot.data![index].id));
              },
            ),
          );
        } else {
          if ((snapshot.data?.length ?? 0) == 0) {
            return const Center(
              child: Text('No data'),
            );
          } else {
            return const Center(
              child: Text('Add first data'),
            );
          }
        }
      },
    );
  }
}
