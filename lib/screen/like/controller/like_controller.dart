import 'package:db_miner_app/model/db_model.dart';
import 'package:db_miner_app/utils/db_helper.dart';
import 'package:get/get.dart';

class LikeController extends GetxController{
  RxList<DBModel> likeList = <DBModel>[].obs;

  Future<void> likegetData()async{
    List<DBModel> like = await DbHelper.helper.readQuotesData();
    likeList.value = like;
  }
}