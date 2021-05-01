import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Center(
      child: Text('Hihi!'),
    ),
  ));
}

// MaterialApp kế thừa từ WidgetsApp và thêm vào các chức nang cụ thể của
// material-design như AnimatedTheme và GridPaper.
// được sử dụng chung để bao bọc nhiều widgets con, để xây dựng UI
