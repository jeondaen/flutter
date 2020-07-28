import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<RepoInfo> list = new List();

  Future<List<RepoInfo>> getRepositories() async {
    final response =
        await http.get('https://api.github.com/search/repositories?q=flutter');

    final jsonObject = jsonDecode(response.body);
    //jsonObject['items'] is array
    jsonObject['items'].forEach((item) {
      String x = item['commits_url'].toString().split("{")[0];
      list.add(new RepoInfo(item['name'], x));
    });
    //final repositories =
    //  jsonObject['items'].map((item) => item['name']).cast<String>().toList();

    return list;
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
        body: FutureBuilder<List<RepoInfo>>(
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
                  padding: EdgeInsets.all(2),
                  child: ListTile(
                    title: Text('${repositories[index].name}'),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SecondRoute.routeName,
                        arguments: repositories[index],
                      );
                    },
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
  static final String routeName = "";

  Future<List<String>> getCommits(url) async {
    final response = await http.get(url);
    final jsonObject = jsonDecode(response.body);
    final List<String> list = new List();

    jsonObject.forEach((item) => list.add(item['commit']['message']));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    final RepoInfo repoInfo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Commits"),
      ),
      body: FutureBuilder(
        future: getCommits(repoInfo.commitsUrl),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final commits = snapshot.data;
          return ListView.builder(
            itemCount: commits.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('commit $index : ${commits[index]}'),
              );
            },
          );
        },
      ),
    );
  }
}

class RepoInfo {
  final String name;
  final String commitsUrl;

  RepoInfo(this.name, this.commitsUrl);
}
