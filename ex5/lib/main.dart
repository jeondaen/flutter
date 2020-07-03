import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<List<String>> getRepositories() async {
    final response =
        await http.get('https://api.github.com/search/repositories?q=flutter');

    final jsonObject = jsonDecode(response.body);
    final repositories = jsonObject['items']
        .map((item) => item['owner']['repos_url'])
        .cast<String>()
        .toList();
    return repositories;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Repositories'),
        ),
        body: FutureBuilder<List<String>>(
          future: getRepositories(),
          builder: (context, snapshot) {
            final repositories = snapshot.data;

            print(snapshot.toString());
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
              itemCount: repositories.length,
              itemBuilder: (context, index) {
                String i = index.toString();

                return Container(
                  padding: EdgeInsets.all(16),
                  child: Text('repo $i: ${repositories[index]}'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
