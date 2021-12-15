// Mạc định chương trình sẽ chạy mà ko chờ

void main() {
  print('bat dau goi mon');
  print(goiDoAn());
  print('Cho goi mon...');
}

String goiDoAn() {
  print('goiDoAn');
  var monAn = lamDoAn();

  return 'Mon an $monAn da dc goi';
}

Future<String> lamDoAn() {
  return Future.delayed(Duration(seconds: 7), () => 'Banh Mi 7 phut');
}

// bat dau goi mon
// goiDoAn
// Mon an Instance of 'Future<String>' da dc goi
// Cho goi mon...
// <<<< pause 7 minutes >>>>
// Exited


// Dùng async/await chương trình sẽ chờ hàm `async`

void main() async {
  print('bat dau goi mon');
  print(await goiDoAn());
  print('Cho goi mon...');
}

Future<String> goiDoAn() async {
  print('goiDoAn');
  var monAn = await lamDoAn();

  return 'Mon an $monAn da dc goi';
}

Future<String> lamDoAn() {
  return Future.delayed(Duration(seconds: 7), () => 'Banh Mi 7 phut');
}

// bat dau goi mon
// goiDoAn
// <<<< pause 7 minutes >>>>
// Mon an Banh Mi 7 phut da dc goi
// Cho goi mon...
// Exited

// Dùng .then() chương trình sẽ chạy 1 lượt, các hàm là `async` sẽ chạy background và show ra sau.

void main() {
  print('bat dau goi mon');
  goiDoAn().then((val) {
    print(val);
  });
  print('Cho goi mon...');
}

Future<String> goiDoAn() async {
  print('goiDoAn');
  var monAn = await lamDoAn();

  return 'Mon an $monAn da dc goi';
}

Future<String> lamDoAn() {
  return Future.delayed(Duration(seconds: 7), () => 'Banh Mi 7 phut');
}

// bat dau goi mon
// goiDoAn
// Cho goi mon...
// <<<< pause 7 minutes >>>>
// Mon an Banh Mi 7 phut da dc goi
// Exited







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
