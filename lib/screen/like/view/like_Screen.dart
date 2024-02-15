import 'package:db_miner_app/screen/like/controller/like_controller.dart';
import 'package:db_miner_app/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  LikeController likeController = Get.put(LikeController());

  @override
  void initState() {
    super.initState();
    likeController.likegetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: likeController.likeList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${likeController.likeList[index].quotes}"),
              subtitle: Text("${likeController.likeList[index].author}"),
              trailing: IconButton(
                  onPressed: () {
                    DbHelper.helper.deleteQuotesData(
                        id: "${likeController.likeList[index].id}");
                    likeController.likegetData();
                  },
                  icon: Icon(Icons.delete)),
              leading: Text("${likeController.likeList[index].id}"),
            );
          },
        ),
      ),
    );
  }
}
