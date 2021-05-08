import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Falppy Bird'),
            backgroundColor: Colors.green[200],
          ),
          body: Center(
            child: Column(
              children: [
                Flexible(
                  child: Image(
                    image: AssetImage(
                      'images/bird.png',
                    ),
                  ),
                  flex: 2,
                  fit: FlexFit
                      .tight, // thay vì cho flexible chaỵ theo chiều cao của hình thì set cái này để ăn theo flex=2
                ),
                Flexible(
                  child: Image(
                    image: AssetImage(
                      'images/pipe.png',
                    ),
                    fit: BoxFit
                        .contain, // cho hình = size của flexible để render ra nhiều loại màn hình ko bị thiếu/dư phần đuôi của pipe
                  ),
                  flex: 2,
                  fit: FlexFit
                      .tight, // thay vì cho flexible chaỵ theo chiều cao của hình thì set cái này để ăn theo flex=2
                ),
              ],
            ),
          ),
          backgroundColor: Colors.cyan[300]),
    );
  }
}
