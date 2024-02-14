import 'package:db_miner_app/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeModel model=Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${model.name}"),
        centerTitle: true,
      ),
      body: ListView.builder(itemCount: model.quotesList!.length,itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          height: 135,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 400,
                  child: Text("${model.quotesList![index]}",style: TextStyle(fontSize: 18),overflow: TextOverflow.clip,maxLines: 2,),),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                  child: Text("- ${model.authorList![index]}",style: TextStyle(fontSize: 18),)),
            ],
          ),
        );
      },)
    );
  }
}
