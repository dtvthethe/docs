import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Falppy Bird'),
            backgroundColor: Colors.green[200],
          ),
          body: Center(
            child: Column(
              children: [
                Flexible(
                  child: Image(
                    image: AssetImage(
                      'images/bird.png',
                    ),
                  ),
                  flex: 2,
                  fit: FlexFit.tight,
                ),
                Flexible(
                  child: Image(
                    image: AssetImage(
                      'images/pipe.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                  flex: 2,
                  fit: FlexFit.tight,
                ),
              ],
            ),
          ),
          backgroundColor: Colors.cyan[300]),
    );
  }
}
