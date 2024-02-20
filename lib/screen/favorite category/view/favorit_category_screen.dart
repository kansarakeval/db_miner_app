import 'package:db_miner_app/screen/favorite%20category/controller/favorite_controller.dart';
import 'package:db_miner_app/screen/home/controller/home_controller.dart';
import 'package:db_miner_app/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FavoritCategoryScreen extends StatefulWidget {
  const FavoritCategoryScreen({super.key});

  @override
  State<FavoritCategoryScreen> createState() => _FavoritCategoryScreenState();
}

class _FavoritCategoryScreenState extends State<FavoritCategoryScreen> {
  FavoriteController controller = Get.put(FavoriteController());
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.favoritegetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () =>  ListView.builder(
          itemCount: controller.favoriteList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 100,
              decoration: BoxDecoration(color: homeController.getRandomColor(),borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${controller.favoriteList[index].name}",
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                  IconButton(onPressed: () {
                    DbHelper.helper.deleteCategoryData(
                        id: "${controller.favoriteList[index].id}");
                    controller.favoritegetData();
                  }, icon: Icon(Icons.delete,color: Colors.black,))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
