import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter {
  int _index = 107;

  Counter(int index) {
    this._index = index;
  }

  int get index => this._index;
  set index(int val) => this._index + val;
}

class CounterSerice {
  late Counter _counter;

  CounterSerice(Counter counter) {
    this._counter = counter;
  }

  Counter get counter => this._counter;
}

class ExCouterProxyProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Counter>(
          create: (_) => Counter(1999),
        ), // Khai báo các type muốn gom vào T của proxy
        ProxyProvider<Counter, CounterSerice>(
          // T: (Counter) các type muốn gom (làm tham số cho các constructor level con), R: CounterSerice
          update: (context, counter, counterModel) => CounterSerice(counter),
        )
      ],
      child: Root(),
    );
  }
}

class CounterModel with ChangeNotifier {
  late CounterSerice _counterSerice;

  CounterModel(CounterSerice counterSerice) {
    this._counterSerice = counterSerice;
  }

  CounterSerice get counterSerice => _counterSerice;
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proxy Provider'),
      ),
      body: ChangeNotifierProvider<CounterModel>.value(
          value: CounterModel(Provider.of<CounterSerice>(context)),
          child: Consumer<CounterModel>(
            builder: (context, counterModel, child) => Text(
              counterModel.counterSerice.counter.index.toString(),
            ),
          )),
    );
  }
}
