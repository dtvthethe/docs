import 'package:db_and_provider/todo/base/base_event.dart';

class RemoveEvent extends BaseEvent {
  late int id;

  RemoveEvent({required this.id});
}
