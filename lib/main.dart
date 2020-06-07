import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

Future<String> latte =
    Future.delayed(Duration(seconds: 4), () => 'Large Latte');

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("FUTURE BUILDER"),
        ),
        body: Center(
          child: FutureBuilder<String>(
              future: latte,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  children = <Widget>[
                    Text("${snapshot.data}"),
                  ];
                } else if (snapshot.hasError) {}
                else {
                  children = <Widget>[
                    SizedBox(
                      child: LinearProgressIndicator(),
                      width: 600,
                      height: 30,
                    )
                  ];
                }
                return Center(
                  child: Column(
                    children: children,
                  ),
                );
              }),
          heightFactor: 45.0,
        ),
      ),
    );
  }
}
