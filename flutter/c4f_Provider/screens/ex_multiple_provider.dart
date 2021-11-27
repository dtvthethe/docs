import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterUnsign with ChangeNotifier {
  int counter = 0;
  increment() {
    this.counter++;
    print(this.counter);
    notifyListeners();
  }
}

class CounterSign with ChangeNotifier {
  int counter = 0;
  subtraction() {
    this.counter--;
    print(this.counter);
    notifyListeners();
  }
}

class MyMultiProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterUnsign>(create: (_) => CounterUnsign()),
        ChangeNotifierProvider<CounterSign>(create: (_) => CounterSign()),
      ],
      child: Root(), // Root phải là child thì mới dùng đc
    );
  }
}

class ExMultipleProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyMultiProvider(); // gọi provider trước rồi mới gọi đến UI
  }
}

// builder context dùng đc provider phải là builder context con
class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MutiProvider'),
      ),
      body: Parent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: () {
          context.read<CounterUnsign>().increment();
          context.read<CounterSign>().subtraction();
        },
      ),
    );
  }
}

class Parent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Trai(),
        Gai(),
      ],
    );
  }
}

class Trai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterUnsign>(
      builder: (context, value, child) => Text(value.counter.toString()),
    );
  }
}

class Gai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(context.watch<CounterSign>().counter.toString());
  }
}
