import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future _repo =
      http.get('https://api.github.com/search/repositories?q=flutter');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Repositories'),
        ),
        body: FutureBuilder<http.Response>(
          future: _repo,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var list = jsonDecode(snapshot.data.body);
              list = list['items'];
              List<String> repoList = [];

              for (var i = 0; i < list.length; i++) {
                repoList.add(list[i]['owner']['repos_url']);
              }

              return ListView.builder(
                itemCount: repoList.length,
                itemBuilder: (context, index) {
                  String i = index.toString();

                  return Container(
                    height: 50,
                    child: Container(
                      child: Text('repo $i: ${repoList[index]}'),
                    ),
                  );
                },
              );
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
