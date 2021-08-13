/*
Container: 
    - ko có child: auto size full màn hình
    - có child: auto size trim nội dung

    - margin/padding: EdgeInsets. :
        .symmetric(): set vertical & horizontal
        .fromLTRB()
        .all(): set all to value

*/

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea( // widget loại bỏ tai thỏ/ move xuống dưới top bar
          child: Container(
            color: Colors.white,
            child: Text('Xin chao!'), // ko có child: auto size full màn hình // có child: auto size trim nội dung
            height: 100.0,
            width: 100.0,
            // margin: EdgeInsets.fromLTRB(10, 0, 90, 20),
            // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: EdgeInsets.only(top: 10, left: 20), // size bên ngoài
            padding: EdgeInsets.all(10), //  bên trong
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
