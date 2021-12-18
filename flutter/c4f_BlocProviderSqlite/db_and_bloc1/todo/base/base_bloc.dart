// class parent này tạo 1 line để các children có thể điều kiển duy nhất 1 line
// UI gọi thẳng vào đây để đẩy event vào line
// Đăng ký trước các sự kiện trong line, để lắng nghe (1)
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:db_and_provider/todo/base/base_event.dart';

abstract class BaseBloc {
  // line thứ nhất này để chứa các event
  final StreamController<BaseEvent> _streamController =
      StreamController<BaseEvent>();

  BaseBloc() {
    // (1)
    _streamController.stream.listen((event) {
      if (event is! BaseEvent) {
        throw Exception('BaseBloc 1');
      }

      // dựa vào `event` để xem nó là loại sự kiện gì, VD: add, query, remove
      registEvent(event);
    });
  }

  // để bên UI đẩy event vào đây
  StreamSink<BaseEvent> get mySream => _streamController.sink;

  //TODO
  registEvent(BaseEvent baseEvent);

  @mustCallSuper
  dispose() {
    _streamController.close();
  }
}
