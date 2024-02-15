import 'dart:math';
import 'package:db_miner_app/screen/home/model/home_model.dart';
import 'package:db_miner_app/utils/color.dart';
import 'package:db_miner_app/utils/json_hlper.dart';
import 'package:get/get.dart';
import '../../../utils/share_helper.dart';

class HomeController extends GetxController{
  RxList<HomeModel> dbList= <HomeModel>[].obs;

  Future<void> dbgetData() async {
    List<HomeModel>? l1= await JsonHelper.jsonHelper.quotesToList();
    dbList.value=l1!;
  }

  getRandomColor(){
    Random random=Random();
    return colorList[random.nextInt(colorList.length)];
  }

  //theme
  RxBool islight = false.obs;

  void changeTheme() async {
    ShareHelper shr = ShareHelper();
    bool? istheme = await shr.getTheme();
    islight.value = istheme ?? false;
  }
}