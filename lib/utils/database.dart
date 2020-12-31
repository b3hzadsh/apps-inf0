import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../models/app_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:core';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      // bool xBool = true;
      //REAL

      for (int i = 0; i < cats.length; i++) {
        await db.execute("CREATE TABLE if not exists ${cats[i]} ("
            "id INTEGER PRIMARY KEY," // should ++ every time
            "app_name TEXT," //
            "ver_number TEXT," //
            "size TEXT," // float + M
            "installs INTEGER," //SHOULD conv 100,000+ to 100000
            "ratting TEXT," //or FLOAT
            "price TEXT," // 0 OR X$ x is float
            "review INTEGER"
            // "isFavorite BIT"
            ")");
      }

      // await db.execute("CREATE TABLE if not exists favorite ("
      //     "id INTEGER PRIMARY KEY,"
      //     "cat TEXT" // tablename
      //     ")");
    });
  }

  addApp(AppModel newClient, String tableName) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM $tableName");
    int id = table.first["id"];
    /* var appList = await DBProvider.db.getAllClients(tableName);
    if ( ! appList.contains(newClient)){

    } */
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into $tableName (id,app_name,ver_number,size,installs,ratting,price,review)" //,isFavorite
        " VALUES (?,?,?,?,?,?,?,?)",
        [
          id,
          newClient.appName,
          newClient.verNumber,
          newClient.size,
          newClient.installs,
          newClient.ratting,
          newClient.price,
          newClient.review,
          //newClient.isFavorite,
        ]);
    return raw;
  }

  getApp(int id, String tableName) async {
    //TODO change this to use in search func , find all appnames that have special given string

    final db = await database;
    var res = await db.query(tableName, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? AppModel.fromMap(res.first) : null;
  }

  Future<List<AppModel>> searchApp(String title) async {
    var dbClient = await database;
    List<AppModel> x = [];

    for (int i = 0; i < cats.length - 1; i++) {
      var result = await dbClient.rawQuery(
          " select * from ${cats[i]} WHERE app_name LIKE '%$title%' ");
      if (result.length > 0)
        result.forEach((element) {
          x.add(AppModel.fromMap(element));
        }); //x.add(AppModel.fromMap(result.first));
    }
    return x;

    /* return null; */
  }

  Future<List<AppModel>> getAllClients(String tableName) async {
    final db = await database;
    var res = await db.query(tableName);
    List<AppModel> list =
        res.isNotEmpty ? res.map((c) => AppModel.fromMap(c)).toList() : [];
    return list;
  }

// Wont use
  deleteClient(int id, String tableName) async {
    final db = await database;
    return db.delete(tableName, where: "id = ?", whereArgs: [id]);
  }

  deleteApp(String appName, String tableName) async {
    final db = await database;
    return db.delete(tableName, where: "app_name = ?", whereArgs: [appName]);
  }

// use in favorite
  deleteAll(String tableName) async {
    final db = await database;
    db.rawDelete("Delete  from $tableName", []);
  }

  deleteAllTables() async {
    final db = await database;
    for (int i = 0; i < cats.length; i++) {
      db.rawDelete("Delete  from ${cats[i]}", []);
    }
  }

// Wont use
  removeTable(String tableName) async {
    if (tableName != "Client" && tableName != "Tables__") {
      final db = await database;
      await db.execute("DROP TABLE IF EXISTS $tableName");
      return db
          .delete("Tables__", where: "first_name = ?", whereArgs: [tableName]);
    }
  }

  List cats = [
    "ART_AND_DESIGN",
    "FAMILY",
    "TOOLS",
    "NEWS_AND_MAGAZINES",
    "BUSINESS",
    "PRODUCTIVITY",
    "GAME",
    "LIFESTYLE",
    "SHOPPING",
    "HEALTH_AND_FITNESS",
    "BEAUTY",
    "VIDEO_PLAYERS",
    "MUSIC",
    "COMMUNICATION",
    "PERSONALIZATION",
    "SOCIAL",
    "SPORTS",
    "AUTO_AND_VEHICLES",
    "BOOKS_AND_REFERENCE",
    "COMICS",
    "DATING",
    "EDUCATION",
    "ENTERTAINMENT",
    "EVENTS",
    "FINANCE",
    "FOOD_AND_DRINK",
    "LIBRARIES_AND_DEMO",
    "MAPS_AND_NAVIGATION",
    "MEDICAL",
    "PARENTING",
    "TRAVEL_AND_LOCAL",
    "WEATHER",
    "Favorites"
  ];
}
