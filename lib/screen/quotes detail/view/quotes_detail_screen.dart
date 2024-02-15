import 'package:db_miner_app/screen/home/controller/home_controller.dart';
import 'package:db_miner_app/screen/like/controller/like_controller.dart';
import 'package:db_miner_app/screen/modele/db_model.dart';
import 'package:db_miner_app/utils/db_helper.dart';
import 'package:db_miner_app/utils/share_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
                      InkWell(
                        onTap: () {
                          Get.toNamed('like');
                        },
                        child: const Text(
                          "like",
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Obx(
                        ()=> Switch(
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
                  SizedBox(
                    width: 400,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "${m1[1]}",
                          textStyle: GoogleFonts.philosopher(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "- ${m1[2]}",
                      style: GoogleFonts.philosopher(fontSize: 25),
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
