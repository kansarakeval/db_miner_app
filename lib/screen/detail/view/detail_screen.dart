import 'package:db_miner_app/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeModel model = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${model.name}"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: model.quotesList!.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed('quotesdetail', arguments: [
                  model.bgImageList![index],
                  model.quotesList![index],
                  model.authorList![index],
                  model.name,
                ]);
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 135,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "${model.bgImageList![index]}",
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 400,
                            child: Text(
                              "${model.quotesList![index]}",
                              style: GoogleFonts.philosopher(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                            ),
                          ),
                          const Spacer(),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "- ${model.authorList![index]}",
                                style: GoogleFonts.philosopher(fontSize: 20,color: Colors.black),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
