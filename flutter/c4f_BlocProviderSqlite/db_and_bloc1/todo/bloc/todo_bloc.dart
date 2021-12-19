import 'dart:math';
import 'dart:async';
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
  final List<Todo> _lstTodo = [];
  final Random _rand = Random();

  @override
  registEvent(BaseEvent baseEvent) {
    // điều khiển line của BaseBloc (1)
    // đăng kí sự kiện cho từng loại event
    if (baseEvent is AddEvent) {
      _addTodoToList(baseEvent); // baseEvent lúc này là AddEvent
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

  _addTodoToList(AddEvent addEvent) {
    _lstTodo.add(Todo(id: _rand.nextInt(1000), name: addEvent.name));
    _streamController.sink.add(_lstTodo);
  }

  _removeTodoFromList(RemoveEvent removeEvent) {
    _lstTodo.removeWhere((todo) => todo.id == removeEvent.id);
    _streamController.sink.add(_lstTodo);
    print(_lstTodo.length);
  }

  _queryTodoFromList(QueryEvent queryEvent) {
    _streamController.sink.add(_lstTodo);
  }
}
