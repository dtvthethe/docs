import 'package:bloc_application/my_bloc.dart';
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
      home: CourseList(),
    );
  }
}

class CourseList extends StatelessWidget {
  // 1 biến này xài chung trong nhiều wg con
  final MyBLoC _myBLoC = MyBLoC();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BLoC Demo'),
        ),
        body: Column(
          children: [
            SearchBar(myBloc: this._myBLoC), // xài ở đây
            Expanded(
              child: Result(myBLoC: this._myBLoC), // xài ở đây
            ),
          ],
        ));
  }
}

class SearchBar extends StatefulWidget {
  late MyBLoC _myBloc;

  SearchBar({required MyBLoC myBloc}) {
    this._myBloc = myBloc;
  }

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _inputController = TextEditingController();

  @override
  void initState() {
    _inputController.addListener(() {
      widget._myBloc
          .search(_inputController.text); // gọi vào pt search trong bloc
    });
    super.initState();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search),
        hintText: 'Search course...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      controller: _inputController,
    );
  }
}

class Result extends StatelessWidget {
  late MyBLoC _myBLoC;

  Result({required MyBLoC myBLoC}) {
    this._myBLoC = myBLoC;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
      initialData: ['Loading...'],
      stream: _myBLoC
          .subjectController.stream, // gọi đến subjectController để lấy data
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) => Text(snapshot.data![index]),
        );
      },
    );
  }
}
