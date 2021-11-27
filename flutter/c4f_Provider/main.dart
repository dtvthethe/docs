import 'package:flutter/material.dart';
import 'package:flutter_application/screens/basic_use.dart';
import 'package:flutter_application/screens/ex_change_notifier.dart';
import 'package:flutter_application/screens/ex_future_provider.dart';
import 'package:flutter_application/screens/ex_multiple_provider.dart';
import 'package:flutter_application/screens/ex_proxy_provider.dart';
import 'package:flutter_application/screens/ex_stream_provider.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.pink,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Provider'),
//         ),
//         // body: BasicUse(),
//         // body: ExFutureProvider(),
//         body: ExStreamProvider(),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // home: ExChangeNotifier(),
      // home: ExMultipleProvider(),
      home: ExCouterProxyProvider(),
    );
  }
}
