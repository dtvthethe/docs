import 'package:db_and_provider/todo/base/base_event.dart';

class AddEvent extends BaseEvent {
  late String name;

  AddEvent({required this.name});
}
