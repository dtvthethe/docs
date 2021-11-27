import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasicUse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyProvider(); // Gọi luôn MyProvider
  }
}

// 1. Create Model data
class Employee {
  String? _name;

  Employee({String? name}) {
    this._name = name;
  }

  String? get name => this._name;
  set name(String? name) => this._name = name;
}

// 2. Tạo stl wg return Provider
// Dùng `Provider<T>(..)` để tạo ko dùng `.value` nếu data bên trong ko thay đổi
class MyProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Employee emp = Employee(name: 'Nhan Vien A');

    return Provider<Employee>(
      create: (context) => emp,
      child: Parent(),
    );
  }
}

// 3. UI
class Parent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UseConsumer(),
        UseProviderOf(),
      ],
    );
  }
}

// Dùng Consumer để truy cập
class UseConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Employee>(
      builder: (context, emp, child) => Text(emp.name ?? '-'),
    );
  }
}

// Vì provider extends InheritedWG nên có thể dùng of<T> để truy cập
class UseProviderOf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Employee emp = Provider.of<Employee>(context);
    return Text(emp.name ?? '-');
  }
}
