import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My app'),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(child: Center(child: Text("kkk"))),
              Container(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  child: Text("Continue"),
                  onPressed: () {},
                ),
              ),
            ],
          )),
    ));
  }
}
