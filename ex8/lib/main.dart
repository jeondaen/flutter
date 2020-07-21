import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ex8",
      home: HomeApp(),
    );
  }
}

// class HomeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Sign in"),
//       ),
//       body: IndexApp(),
//     );
//   }
// }

// class IndexApp extends StatefulWidget {
//   @override
//   _IndexAppState createState() => _IndexAppState();
// }

// class _IndexAppState extends State<IndexApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
//}
