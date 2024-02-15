import 'dart:io';
import 'package:db_miner_app/screen/modele/db_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static DbHelper helper = DbHelper._();

  DbHelper._();

  Database? database;
  final String DB_NAME = "data.db";

  Future<Database> checkDB() async {
    if (database != null) {
      return database!;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, DB_NAME);
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String queryQuotesTable =
            "CREATE TABLE quotes(id INTEGER PRIMARY KEY AUTOINCREMENT, quotes TEXT,author TEXT,name Text)";
        String queryNameTable =
            "CREATE TABLE name(id INTEGER PRIMARY KEY AUTOINCREMENT,quotes TEXT,author TEXT,name Text)";
        db.execute(queryQuotesTable);
        db.execute(queryNameTable);
      },
    );
  }

  //insertQuotes
  Future<void> insertQuotesData(DBModel dbModel) async {
    database = await checkDB();
    database!.insert("quotes", {
      "quotes": dbModel.quotes,
      "author": dbModel.author,
      "name": dbModel.name
    });
  }

  //readQuotes
  Future<List<DBModel>> redQuotesData() async {
    database = await checkDB();
    String query = "SELECT * FROM quotes";
    List<Map> data = await database!.rawQuery(query, null);
    List<DBModel> modelList = data.map((e) => DBModel.mapToModel(e)).toList();
    return modelList;
  }

  //deleteQuotes
  Future<void> deleteQuotesData({required String id}) async {
    database = await checkDB();
    database!.delete("quotes",where: "id=?",whereArgs: [id]);
  }
}
