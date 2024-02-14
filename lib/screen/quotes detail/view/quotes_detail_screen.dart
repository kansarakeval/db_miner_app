import 'package:db_miner_app/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class QuotesDetailScreen extends StatefulWidget {
  const QuotesDetailScreen({super.key});

  @override
  State<QuotesDetailScreen> createState() => _QuotesDetailScreenState();
}

class _QuotesDetailScreenState extends State<QuotesDetailScreen> {
  List m1 = Get.arguments as List;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite),
                    ),
                    Text(
                      "like",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),

                ),
                PopupMenuItem(
                    child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.nightlight),
                    ),
                    Text(
                      "thime",
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
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
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
                    style: GoogleFonts.philosopher(fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "- ${m1[2]}",
                        style: GoogleFonts.philosopher(fontSize: 25),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
