import 'package:db_miner_app/screen/home/controller/home_controller.dart';
import 'package:db_miner_app/utils/app_routes.dart';
import 'package:db_miner_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  HomeController controller=Get.put(HomeController());
  runApp(
    Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: controller.islight.value?lightTheme:darkTheme,
        routes: app_routes,
      ),
    )
  );
}