import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
class DatabaseHelper{
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  final String tableUser ="userTable";
  final String columnId  = "id";
  final String columnUsername = "username";
  final String columnPassword = "password";

  Future<Database> get db async{
    if (_db !=null){
      return _db;
    }
    
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'maindb.db');

    var ourDB = await openDatabase(path,version: 1,onCreate: _onCreate);

  }
  _onCreate(Database db, int version) async{
    await db.execute(
        "CREATE TABLE $tableUser($columnId PRIMARY KEY AUTOINCREMENT, $columnUsername TEXT, $columnPassword TEXT)");
  }


}