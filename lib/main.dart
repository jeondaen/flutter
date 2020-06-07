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
        body: Column(
          children: <Widget>[
            Center(
              child: Text(
                "Welcome",
                style: TextStyle(fontSize: 20.0),
              ),
              heightFactor: 35.0,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text("Continue"),
                ),
                SizedBox(width: 20.0,)
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            )
          ],
        ),
      ),
    );
  }
}
