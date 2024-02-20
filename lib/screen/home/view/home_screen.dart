import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:db_miner_app/model/db_model.dart';
import 'package:db_miner_app/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:db_miner_app/screen/home/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.dbgetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quotes",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Get.toNamed("favoritcategory");
          }, icon: const Icon(Icons.category))
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.dbList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 140,
              decoration: BoxDecoration(
                  color: controller.getRandomColor(),
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () {
                  Get.toNamed('detail', arguments: controller.dbList[index]);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              "${controller.dbList[index].name}",
                              textStyle: GoogleFonts.philosopher(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              speed: const Duration(milliseconds: 200),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              DbHelper.helper.insertCategoryData(
                                  controller.dbList[index].name!);
                              for (int i = 0;
                                  i <
                                      controller
                                          .dbList[index].quotesList!.length;
                                  i++) {
                                DbHelper.helper.insertNameData(
                                  DBModel(
                                      name: controller.dbList[index].name,
                                      author: controller
                                          .dbList[index].authorList![i],
                                      quotes: controller
                                          .dbList[index].quotesList![i]),
                                );
                              }
                            },
                            icon: const Icon(Icons.favorite_border,color: Colors.black,)),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        "${controller.dbList[index].image}",
                        height: 65,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
