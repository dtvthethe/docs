import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Boom {
  Future<int> active() {
    return Future<int>.delayed(Duration(seconds: 2), () => 100);
  }
}

class ExFutureProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<int>.value(
      initialData: 0,
      value: Boom().active(),
      child: ViewUi(),
    );
  }
}

class ViewUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<int>(
        builder: (context, value, child) => Text(value.toString()),
      ),
    );
  }
}
