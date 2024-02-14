import 'package:db_miner_app/screen/dash/view/dash_screen.dart';
import 'package:db_miner_app/screen/detail/view/detail_screen.dart';
import 'package:db_miner_app/screen/splash/view/splash_scree.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> app_routes={
  '/':(context) => const SplashScreen(),
  'dash':(context) => const DashScreen(),
  'detail':(context) => const DetailScreen(),
};