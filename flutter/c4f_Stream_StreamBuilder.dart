// Stream là 1 dòng dữ liệu bất đồng bộ
// Có thể xử lý bằng cách gọi hàm listen()
// Stream cung cấp phản hồi error
// Có 2 loại stream:
//  - Single subscription: chỉ cho phép 1 client listen
//  - Broadcast: cho phép nhiều client listen

// Có 3 cach tạo Stream
//  - Tạo stream từ delay
//  - Tạo stream từ iterable
//  - Tạo stream từ Stream period

import 'dart:async';

void main(List<String> arguments) {
  ///////////////////////////////////////////
  print('Start: Tạo stream');
  // Tạo stream từ delay:
  var data1 = Future<int>.delayed(Duration(seconds: 3), () => 1000);
  var stream1 = Stream<int>.fromFuture(data1);
  stream1.listen((event) {
    print(event.toString());
  });

  // Tạo stream từ iterable:
  var data2 = Iterable<int>.generate(10, (index) => index + 1);
  var stream2 = Stream<int>.fromIterable(data2);
  stream2.listen((event) {
    print(event.toString());
  });

  // Tạo stream từ Stream period:
  var stream3 = Stream<int>.periodic(Duration(seconds: 1), (val) => val + 1);
  stream3.listen((event) {
    print(event.toString());
  });
  print('End: Tạo stream');

  ///////////////////////////////////////////
  print('Start: Single subscription');
  var data1 = Future<int>.delayed(Duration(seconds: 3), () => 1000);
  var stream1 = Stream<int>.fromFuture(data1);

  stream1.listen((event) {
    // <-- dang ki lan 1
    print(event.toString());
  });

  stream1.listen((event) {
    // <-- dang ki lan 2 -> lỗi, vì chỉ cho phép 1 lần 1 client lắng nghe
    print(event.toString());
  });
  print('End: Single subscription');

  ///////////////////////////////////////////
  print('Start: Broadcast');
  var data1 = Future<int>.delayed(Duration(seconds: 3), () => 1000);
  var stream1 = Stream<int>.fromFuture(data1).asBroadcastStream(); // broadcast

  stream1.listen((event) {
    // <-- dang ki lan 1
    print(event.toString());
  });

  stream1.listen((event) {
    // <-- dang ki lan 2 -> OK, vì broadcast cho phép nhiều client lắng nghe
    print(event.toString());
  });
  print('End: Broadcast');

  ///////////////////////////////////////////
  print('Start: Pause at second 3, Resume at second 6');
  var streamHandle =
      Stream<int>.periodic(Duration(seconds: 1), (index) => index + 1);

  var streamSubscription = streamHandle.take(10).listen((event) {
    print(event.toString());
  });

  // pause ở giây thứ 3
  Future.delayed(Duration(seconds: 3), () {
    streamSubscription.pause(Future.delayed(Duration(milliseconds: 100), () {
      print('pause');
    }));
  });

  // resum ở giây thứ 6 (pause 3 giây)
  Future.delayed(Duration(seconds: 6), () {
    streamSubscription.resume();
  });
  print('End: Pause at second 3, Resume at second 6');

  ///////////////////////////////////////////
  print('Start: Stream controller');
  var stControl = StreamController<int>();
  stControl.stream.listen((event) {
    print(event.toString());
  });

  stControl.sink.add(100);
  stControl.sink.add(300);
  print('End: Stream controller');

  ///////////////////////////////////////////
  print('Start: Stream tranformer');
  var stream =
      Stream<int>.periodic(Duration(seconds: 1), (period) => period + 1)
          .asBroadcastStream()
          .take(10);

  stream.transform(StreamTransformer.fromHandlers(handleData: (val, evSink) {
    evSink.add(val + 100);
  })).listen((event) {
    print('tranformed = $event');
  });

  stream.listen((event) {
    print('no tranform = $event');
  });
  print('End: Stream tranformer');
}


///////////////////StreamBuilder: ko cần setData() vẫn tự upate UI, dùng đc vs StateLessWidget////////////////////////

class MyCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build UI.');
    // phaỉ tạo ra 1 StreamController để add vô, vì theo í kiến cá nhân thì ko nên controll cái
    // controller chính đó vì TH nếu có nhiều observer cùng lắng nghe mà controll cái
    // subject chính đó thì các obsẻver khác cũng sẽ bị ảnh hưởng
    var _streamController = StreamController<int>();
    myStream().listen((event) {
      if (event == 9) {
        _streamController.close();
      }

      _streamController.add(event);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('hihi'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error.');
            }

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('None.');
              case ConnectionState.waiting:
                return Text('Waiting.');
              case ConnectionState.done:
                return Text('Done.');
              case ConnectionState.active:
                return Text('Active: ${snapshot.data}');
              default:
                return Text('Default.');
            }
          },
        ),
      ),
    );
  }
}

Stream<int> myStream() {
  return Stream<int>.periodic(Duration(seconds: 1), (val) => val + 1).take(10);
}
