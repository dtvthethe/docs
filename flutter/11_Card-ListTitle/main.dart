import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(// <--------------------
                backgroundImage: AssetImage('images/doraemon.png'),
                radius: 50.0,
              ),
              Text(
                'Doraemon',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Pacifico',
                  fontSize: 23.0,
                ),
              ),
              Text(
                'Stand by Me 2!',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SourceSansPro',
                  letterSpacing: 4.0,
                ),
              ),
              SizedBox(// <--------------------
                child: Divider(
                  color: Colors.white,
                ),
                width: 100.0,
              ),
              Card(// <--------------------
                margin: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Padding(// <--------------------
                  // Custom ListTitle
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      SizedBox(
                        width: 35.0,
                      ),
                      Text(
                        '0987878767',
                        style: TextStyle(
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(// <--------------------
                margin: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: ListTile(// <--------------------
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'doraemon@dora.nobi',
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
