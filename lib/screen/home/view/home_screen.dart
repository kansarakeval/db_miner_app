import 'package:db_miner_app/screen/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

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
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.dbList.length,
          itemBuilder: (context, index) {
            return Obx(
              () => InkWell(
                onTap: () {
                  Get.toNamed('detail', arguments: controller.dbList[index]);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: 135,
                  decoration: BoxDecoration(
                      color: controller.getRandomColor(),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.dbList[index].name}",
                        style: GoogleFonts.philosopher(fontSize: 25,fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            "${controller.dbList[index].image}",
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
