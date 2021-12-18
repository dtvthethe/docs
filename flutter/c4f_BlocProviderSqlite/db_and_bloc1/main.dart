/*
ĐỌC CẨN THẬN CÁC COMMENTS Ở CÁC FILE lib/todo~
Idea:
- Tạo 2 stream controller: 1 cái lắng nghe event, 1 cái điều khiển list data
- stream controller (1) lắng nghe event thì tạo các logic sử lý trong .listen(...)
- stream điều khiển data (2) thì duy nhất chỉ chứa list để hiển thị
UI: chỉ có nhiệm vụ gửi event vào cái stream controll (1) lắng nghe event
Ko goi den TodoDatabase vì đã init() trong main và TodoDatabase là static nên dữ đc connect (Singleton).
 */
import 'package:flutter/material.dart';
import 'package:db_and_provider/todo/ui/todo_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoUi(),
    );
  }
}
