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
    final repositories =
        jsonObject['items'].map((item) => item['name']).cast<String>().toList();

    return repositories;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SecondRoute.routeName: (context) => SecondRoute(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Repositories'),
        ),
        body: FutureBuilder<List<String>>(
          future: getRepositories(),
          builder: (context, snapshot) {
            final repositories = snapshot.data;

            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
              itemCount: repositories.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(16),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        SecondRoute.routeName,
                        arguments: RepoInfo(
                          'Commits',
                          index,
                        ),
                      );
                    },
                    child: Text('${repositories[index]}'),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  static const routeName = '/extractArguments';

  Future<String> getRepositories(int index) async {
    final response = await http.get(
        'https://api.github.com/repos/iampawan/FlutterExampleApps/commits');

    final jsonObject = jsonDecode(response.body);
    final repositories = jsonObject[index]['commit']['url'];

    return repositories;
  }

  @override
  Widget build(BuildContext context) {
    final RepoInfo repoInfo = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Commits"),
      ),
      body: FutureBuilder(
        future: getRepositories(repoInfo.number),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          return Center(
            child: Text(snapshot.data),
          );
        },
      ),
      // body: Center(
      //   child: Text(repoInfo.name),
      // ),
    );
  }
}

class RepoInfo {
  final String name;
  final int number;

  RepoInfo(this.name, this.number);
}
