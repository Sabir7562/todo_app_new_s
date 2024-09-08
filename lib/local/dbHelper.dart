import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper {
  Dbhelper._();
  static final Dbhelper getInstance = Dbhelper._();
  static final String sno = "sno";
  static final String table_name = "todoData";
  static final String column_title_name = "title";
  static final String column_desc_name = 'desc';
  Database? myDB;

  ///---------get Database----------
  Future<Database> getDb() async {
    if (myDB != null) {
      return myDB!;
    } else {
      return opendb();
    }
  }

  ///---------open database------------
  Future<Database> opendb() async {
    Directory appDir = await getApplicationDocumentsDirectory(); // Updated
    String rootPath = appDir.path;
    String dbPath = join(rootPath, "todo.db");
    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(
          "CREATE TABLE $table_name ($sno INTEGER PRIMARY KEY AUTOINCREMENT, $column_title_name TEXT, $column_desc_name TEXT)"); // Fixed the SQL statement
    });
  }

  ///----------add data-------
  Future<bool> addData({required String title, required String desc}) async {
    var db = await getDb();
    int rowEffected = await db.insert(table_name, {
      column_title_name: title,
      column_desc_name: desc
    });
    return rowEffected > 0;
  }

  ///----------get all data----------
  Future<List<Map<String, dynamic>>> getAllNote() async {
    var db = await getDb();
    var allNotes = await db.query(table_name);
    return allNotes;
  }
}
