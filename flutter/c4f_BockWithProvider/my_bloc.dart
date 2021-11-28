// Cơ bản thì BLoC tách biệt xử lý UI và Logic ở 2 nơi
// BLoC là nơi xử lý nghiệp vụ
// BLoC giao tiếp với UI thông qua Stream

import 'dart:async';

class MyBLoC {
  List<String> _subjects = [
    'Java',
    'CScharp',
    'Swift',
    'JavaScript',
    'SQL',
    'MongoDB',
    'Dart',
    'Flutter',
    'VisualBasic',
    'TypeScript',
    'Blockchain',
    'NodeJS',
    'PHP',
    'Laravel',
  ];

  // biến này sẽ đc gọi để sink data ttrong bloc và lấy data ra ở ngoài wg con
  StreamController<List<String>> subjectController =
      StreamController<List<String>>();

  // pt này đc gọi ở ngoài wg để sink dữ liệu vào stream
  void search(String query) {
    if (query.isEmpty) {
      subjectController.sink.add(_subjects);
    } else {
      List<String> resultSearch = [];
      _subjects.forEach((element) {
        if (element.toLowerCase().contains(query)) {
          resultSearch.add(element);
        }
      });
      subjectController.sink.add(resultSearch);

      // Phần add xử lý này có thể tham khảo `Completer<List<String>>` `.complete(result array)`
      // var a = Completer<List<String>>();
      // add to list array data (1)
      // a.complete(`(1)`);
      // return a.future
      // Cách dùng: a.then(....);
    }
  }

  void dispose() {
    subjectController.close();
  }
}
