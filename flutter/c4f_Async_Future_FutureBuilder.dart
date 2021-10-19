// Future là giá trị đc trả về trong tương lai.
/////////////////////////Future/////////////////////////////
void main(List<String> arguments) {
  print('Start');
  // syncA();
  // print(await syncB());
  // syncB().then((value) => value - 10).then((value) => print(value));
  syncC()
      .then((value) => print(value))
      .onError<IntegerDivisionByZeroException>(
          (error, stackTrace) => print('error chia cho 0'))
      .onError((error, stackTrace) => print(error.toString()));
  print('End');
}

Future<void> syncA() {
  return Future.delayed(Duration(seconds: 2), () => print('syncA'));
}

Future<int> syncB() {
  return Future.delayed(Duration(seconds: 2), () => 100);
}

Future<int> syncC() {
  return Future.delayed(
      Duration(seconds: 2), () => throw IntegerDivisionByZeroException());
}

/////////////////////////FutureBuilder/////////////////////////////

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: FutureBuilder<int>(
            // <----- <int>
            future: syncVal(),
            builder: (context, snapshot) {
              // <----- snapshot.data
              return snapshot.hasData
                  ? Text(snapshot.data.toString())
                  : Text(snapshot.error.toString());
            },
            initialData: -1994,
          ),
        ),
      ),
    );
  }
}

Future<int> syncVal() {
  return Future.delayed(Duration(seconds: 3), () {
    return 100;
    // throw Exception('hihi');
  });
}
