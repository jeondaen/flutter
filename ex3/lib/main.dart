import 'package:flutter/material.dart';

final List<String> students = <String>[];

void main() {
  int j = 0;
  for (var i = 0; i < 100; i++) {
    String student = "Student" + j.toString();

    students.add(student);
    j++;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Students'),
          ),
          body: ListOfStudent()),
    );
  }
}

final list = ListView.builder(itemBuilder: (BuildContext context, int index) {
  return Container(
    child: Center(
      child: Text('${students[index]}'),
    ),
  );
});

class ListOfStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return list;
  }
}
