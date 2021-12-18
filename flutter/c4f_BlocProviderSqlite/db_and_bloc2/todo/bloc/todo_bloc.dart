import 'dart:math';
import 'dart:async';
import 'package:db_and_provider/todo/db/todo_table.dart';
import 'package:db_and_provider/todo/model/todo.dart';
import 'package:db_and_provider/todo/base/base_bloc.dart';
import 'package:db_and_provider/todo/base/base_event.dart';
import 'package:db_and_provider/todo/event/add_event.dart';
import 'package:db_and_provider/todo/event/query_event.dart';
import 'package:db_and_provider/todo/event/remove_event.dart';

// Kế thừa từ BaseBloc có nghĩa là có thể đièu kiển đc line của BaseBloc (1)
class TodoBloc extends BaseBloc {
  // line thứ 2 này để chứa data.
  final StreamController<List<Todo>> _streamController =
      StreamController<List<Todo>>();
  List<Todo> _lstTodo = [];
  final Random _rand = Random();
  final TodoTable _todoTable = TodoTable();

  @override
  registEvent(BaseEvent baseEvent) async {
    // điều khiển line của BaseBloc (1)
    // đăng kí sự kiện cho từng loại event
    if (baseEvent is AddEvent) {
      await _addTodoToList(baseEvent); // baseEvent lúc này là AddEvent
    } else if (baseEvent is RemoveEvent) {
      _removeTodoFromList(baseEvent); // baseEvent lúc này là RemoveEvent
    } else if (baseEvent is QueryEvent) {
      _queryTodoFromList(baseEvent); // baseEvent lúc này là QueryEvent
    } else {
      throw Exception('TodoBloc: 1');
    }
  }

  @override
  dispose() {
    _streamController.close();
    return super.dispose();
  }

  StreamController<List<Todo>> get lstTodoController => _streamController;

  _addTodoToList(AddEvent addEvent) async {
    Todo todo = Todo(id: _rand.nextInt(1000), name: addEvent.name);
    _lstTodo.add(todo);
    await _todoTable.insert(todo);
    _streamController.sink.add(_lstTodo);
  }

  _removeTodoFromList(RemoveEvent removeEvent) async {
    _lstTodo.removeWhere((todo) => todo.id == removeEvent.id);
    await _todoTable.delete(removeEvent.id);
    _streamController.sink.add(_lstTodo);
  }

  _queryTodoFromList(QueryEvent queryEvent) async {
    _lstTodo = await _todoTable.get();
    _streamController.sink.add(_lstTodo);
  }
}
