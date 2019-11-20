import 'package:database_sqlflite/utils/database_helper.dart';
import 'package:flutter/material.dart';

import 'models/user.dart';

void main() async {
  List _users;
  var db = new DatabaseHelper();

  //update user
  User anUpdated = User.fromMap({
    "username": "anUpdated",
    "password": "passwordUpdated",
    "id": 1,
  });

  int re = await db.updateUser(anUpdated);
  print(re);

  _users = await db.getAllUsers();

  for (int i = 0; i < _users.length; i++) {
    User u = User.map(_users[i]);
    print(
        'Username : ${u.username} and Password : ${u.password} and ID: ${u.id}');
  }

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
