import 'package:flutter/material.dart';
import 'web_json.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Text('JSON App'),
        ),
        body: Center(
          child: ShowJson(),
        ),
      ),
    );
  }
}

class ShowJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WebJson webJson = WebJson();
    Info info = webJson.getInfo();

    return Container(
      child: Column(
        children: [
          Row(children: [
            Column(
              children: [
                Text('ID:'),
              ],
            ),
            Column(
              children: [
                Text(info.id.toString()),
              ],
            )
          ]),
          Row(
            children: [
              Text('Product'),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text('ID: '),
                ],
              ),
              Column(
                children: [
                  Text(info.company.id.toString()),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text('Name: '),
                ],
              ),
              Column(
                children: [
                  Text(info.company.name),
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: info.products.length,
                itemBuilder: (context, index) => Row(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(webJson
                                    .getInfo()
                                    .products[index]
                                    .id
                                    .toString()),
                              ],
                            ),
                            Column(
                              children: [
                                Text(info.products[index].name),
                              ],
                            ),
                            Column(
                              children: [
                                Text(webJson
                                    .getInfo()
                                    .products[index]
                                    .price
                                    .toString()),
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
          )
        ],
      ),
    );
  }
}
