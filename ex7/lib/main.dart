import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class WeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: getWeather(),
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

Stream<String> getWeather() async* {
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
      home: MainScreen(),
    );
  }
}

// Main Frame
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ex7"),
      ),
      body: WeatherWidget(),
    );
  }
}
