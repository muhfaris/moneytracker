import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB()async{
    // getDatabasesPath is get default database location from sqflite package.
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'moneytracker.db'),
      onCreate: (database, version)async{
        await database.execute(
          "create table transactions(id integer primary key autoincrement)",
        );
      },
      version: 1
    );
  }
/*
  Future<int> insertTransaction(List<User> users)async{
    int result = 0;
    final Database db = await initializeDB();
    for(var user in users){
      result = await db.insert("transactions", user.toMap());
    }
  }

  Future<List<User>> listuser()async{
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query("transactions");
    return queryResult.map((e)=> user.fromMap(e)).toList();
  }

  Future<void> deleteUser(int id) async{
    final Database db = await initializeDB();
    await db.delete("transactions", where: "id=?", whereArgs: [id]);
  }
 */
}