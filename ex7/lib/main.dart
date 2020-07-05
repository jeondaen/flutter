import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: getFuture(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          return Text(snapshot.data);
        },
      ),
    );
  }
}

Stream<String> getFuture() async* {
  await Future.delayed(Duration(seconds: 1));
  yield "Sunny";
  await Future.delayed(Duration(seconds: 1));
  yield "Cloudy";
  await Future.delayed(Duration(seconds: 1));
  yield "Rainy";
}

//Application Frame
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ex7",
      home: MainApp(),
    );
  }
}

// Main Frame
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ex7"),
      ),
      body: HomeApp(),
    );
  }
}
