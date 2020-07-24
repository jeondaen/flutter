import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SuperApp());
}

class SuperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EX8",
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EX8"),
      ),
      body: BodyApp(),
    );
  }
}

class BodyApp extends StatefulWidget {
  @override
  _BodyAppState createState() => _BodyAppState();
}

class _BodyAppState extends State<BodyApp> {
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(200, 100, 200, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (value) => username = value,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          RaisedButton(
            onPressed: () {
              final snackBar = SnackBar(
                content: Text(username),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              );

              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Text("Sign in"),
          )
        ],
      ),
    );
  }
}
