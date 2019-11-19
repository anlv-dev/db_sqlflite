import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';



void main() async {
  runApp(new MaterialApp(
    title: "Database",
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}


