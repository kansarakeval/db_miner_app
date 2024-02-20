import 'package:db_miner_app/model/db_model.dart';
import 'package:db_miner_app/utils/db_helper.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FavoriteController extends GetxController {
  RxList<DBModel> favoriteList = <DBModel>[].obs;

  Future<void> favoritegetData() async {
    List<DBModel> favorite = await DbHelper.helper.readCategoryData();
    favoriteList.value = favorite;
  }
}
