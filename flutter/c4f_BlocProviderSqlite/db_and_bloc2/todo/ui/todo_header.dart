import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:db_and_provider/todo/bloc/todo_bloc.dart';
import 'package:db_and_provider/todo/event/add_event.dart';

class TodoHeader extends StatelessWidget {
  TextEditingController _txtControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Todo Name',
              label: Text('Name'),
            ),
            controller: _txtControll,
          ),
        ),
        Container(
          width: 40,
          height: 40,
          child: Consumer<TodoBloc>(
            builder: (context, todoBloc, child) => GestureDetector(
              child: const Icon(
                Icons.send,
                color: Colors.redAccent,
              ),
              onTap: () {
                todoBloc.mySream.add(AddEvent(name: _txtControll.text));
              },
            ),
          ),
        )
      ],
    );
  }

  dispose() {
    _txtControll.dispose();
  }
}
