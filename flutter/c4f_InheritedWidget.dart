import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OngBa(
        con: ChaMe(),
      ),
    );
  }
}

class MyData extends InheritedWidget {
  MyData({required Widget child, required this.chiSo}) : super(child: child);

  final int chiSo;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static MyData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyData>()!;
  }
}

class OngBa extends StatefulWidget {
  OngBa({required this.con});

  final Widget con;

  @override
  _OngBaState createState() => _OngBaState();
}

class _OngBaState extends State<OngBa> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    print('ong ba');
    return Scaffold(
      body: MyData(
        chiSo: _index,
        child: widget.con,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_time),
        onPressed: () {
          setState(() {
            _index++;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ChaMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('cha me');

    return Container(
      child: Row(
        children: [
          BeGai(),
          BeTrai(),
        ],
      ),
    );
  }
}

class BeGai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('gai');

    final int data = MyData.of(context).chiSo;

    return Text(
      'gai data = $data',
      style: TextStyle(backgroundColor: Colors.amber),
    );
  }
}

class BeTrai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('trai');

    final int duLieu = MyData.of(context).chiSo;

    return Text(
      'trai data = $duLieu',
      style: TextStyle(
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
