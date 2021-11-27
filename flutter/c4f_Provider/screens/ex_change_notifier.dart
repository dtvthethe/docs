import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExChangeNotifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('ExChangeNotifier');

    return MyProvider();
  }
}

// 1. Tạo model data, sử dụng `notifyListeners()`
class Counter with ChangeNotifier {
  int _count = 0;

  int get count => this._count;
  set count(int count) => this._count = count;
  increment() {
    this._count++;
    // Listenable class lắng nghe sự thay đổi của Flutter, notifyListeners() sẽ thông báo sự thay đổi đến các wg con
    notifyListeners();
  }
}

// 2. Tạo Provider dùng ChangeNotifierProvider.value , .value vì là data bên trong có sự update
class MyProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MyProvider có khởi tạo Counter để gán cho value');
    Counter counter = Counter();

    return ChangeNotifierProvider<Counter>.value(
      value: counter,
      child: Grand(Parent()), // Giải quyết vấn đề bị rebuild
    );
  }
}

// 3. UI
// Sử dụng Provider.of<T> để gọi đến func increment() trong class Counter
class Grand extends StatelessWidget {
  Widget con; // Giải quyết vấn đề bị rebuild

  Grand(Widget this.con); // Giải quyết vấn đề bị rebuild

  @override
  Widget build(BuildContext context) {
    print('Grand build lai Provider.of<T> để gọi đến func increment()');
    Counter co = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('ChangeNotifier Provider'),
      ),
      body: this.con,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: () => co.increment(),
      ),
    );
  }
}

class Parent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Parent UI');
    return Column(
      children: [
        UseConsumer(),
        UseProviderOf(),
      ],
    );
  }
}

// Display using Consumer
// Khi truyền wg vào để tránh rebuil thì Cách sử dụng Consumer ko bị rebuild lại khi Provider có update data
class UseConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('UseConsumer');
    return Consumer<Counter>(
      builder: (context, value, child) => Text(value.count.toString()),
    );
  }
}

// Display using Provider.of<T>
// Khi truyền wg vào để tránh rebuil thì Cách sử dụng Provider.of<T> bị rebuild lại khi Provider có update data
class UseProviderOf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('UseProviderOf');
    Counter co = Provider.of<Counter>(context);
    return Text(co.count.toString());
  }
}
