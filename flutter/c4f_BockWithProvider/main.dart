import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bloc_application/my_bloc.dart';

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
      home: Provider<MyBLoC>(
        create: (_) => MyBLoC(),
        child: CourseList(),
      ),
    );
  }
}

class CourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BLoC with Provider'),
        ),
        body: Column(
          children: [
            SearchBar(),
            Expanded(
              child: Result(),
            ),
          ],
        ));
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _inputController = TextEditingController();

  // ERROR: dependOnInheritedWidgetOfExactType<_InheritedProviderScope<MyBLoC?>>()
  //or dependOnInheritedElement() was called before _SearchBarState.initState() completed.

  // @override
  // void initState() {
  //   // DÙng ở đây
  //   final myBloc = Provider.of<MyBLoC>(context);

  //   _inputController.addListener(() {
  //     myBloc.search(_inputController.text); // DÙng ở đây
  //   });
  //   super.initState();
  // }

  // Fix bằng cách để trong hàm didChangeDependencies
  @override
  void didChangeDependencies() {
    // DÙng ở đây
    final myBloc = Provider.of<MyBLoC>(context);

    _inputController.addListener(() {
      myBloc.search(_inputController.text); // DÙng ở đây
    });
    super.didChangeDependencies();
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
  @override
  Widget build(BuildContext context) {
    return Consumer<MyBLoC>(
      builder: (context, myBloc, child) => StreamBuilder<List<String>>(
        initialData: ['Loading...'],
        stream: myBloc
            .subjectController.stream, // gọi đến subjectController để lấy data
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => Text(snapshot.data![index]),
          );
        },
      ),
    );
  }
}
