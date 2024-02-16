import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:db_miner_app/model/db_model.dart';
import 'package:db_miner_app/screen/home/controller/home_controller.dart';
import 'package:db_miner_app/screen/like/controller/like_controller.dart';
import 'package:db_miner_app/utils/db_helper.dart';
import 'package:db_miner_app/utils/share_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class QuotesDetailScreen extends StatefulWidget {
  const QuotesDetailScreen({Key? key}) : super(key: key);

  @override
  State<QuotesDetailScreen> createState() => _QuotesDetailScreenState();
}

class _QuotesDetailScreenState extends State<QuotesDetailScreen> {
  List m1 = Get.arguments as List;
  LikeController controller = Get.put(LikeController());
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.likegetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('like');
              },
              icon: Icon(Icons.save)),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          DBModel dbmodel = DBModel(
                              name: m1[3], author: m1[2], quotes: m1[1]);
                          DbHelper.helper.insertQuotesData(dbmodel);
                          Get.back();
                          controller.likegetData();
                        },
                        icon: const Icon(Icons.favorite),
                      ),
                      const Text(
                        "like",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Obx(
                        () => Switch(
                          value: homeController.islight.value,
                          onChanged: (value) {
                            ShareHelper shr = ShareHelper();
                            shr.setTheme(value);
                            homeController.changeTheme();
                          },
                        ),
                      ),
                      const Text(
                        "time",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          homeController.copy(m1[1]);
                          Get.back();
                          Get.snackbar('copy to quotes', 'Success!');
                        },
                        icon: const Icon(Icons.copy),
                      ),
                      const Text(
                        "copy",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await AsyncWallpaper.setWallpaper(
                              url: m1[0],
                              wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
                              goToHome: true,
                              toastDetails: ToastDetails.error(),
                              errorToastDetails: ToastDetails.error());
                        },
                        icon: const Icon(Icons.wallpaper),
                      ),
                      const Text(
                        "Wallpaper",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            "${m1[0]}",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${m1[1]}",
                    style: GoogleFonts.philosopher(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "- ${m1[2]}",
                      style: GoogleFonts.philosopher(
                          fontSize: 25, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
