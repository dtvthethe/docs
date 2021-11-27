import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExStreamProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<int>.value(
      value: buildData(),
      initialData: 0,
      child: ViewUi(),
    );
  }

  Stream<int> buildData() {
    return Stream<int>.periodic(Duration(seconds: 1), (_) => _++);
  }
}

class ViewUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.watch<int>().toString()),
    );
  }
}
