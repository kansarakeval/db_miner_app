import 'dart:convert';
import 'package:db_miner_app/screen/home/model/home_model.dart';
import 'package:flutter/services.dart';

class JsonHelper{

  static JsonHelper jsonHelper=JsonHelper._();

  JsonHelper._();

  Future<List<HomeModel>?> quotesToList() async {
    var dbString = await rootBundle.loadString("assets/json/db.json");
    List db = jsonDecode(dbString);

    List<HomeModel> homeModelList =
    db.map((e) => HomeModel.mapToModel(e)).toList();

    return homeModelList;
  }
}