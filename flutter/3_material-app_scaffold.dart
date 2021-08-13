import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Mater & Scaff'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Image(
            image: NetworkImage(
              'https://www.w3schools.com/w3css/img_lights.jpg',
            ),
          ),
        )),
    debugShowCheckedModeBanner: false,
  ));
}
