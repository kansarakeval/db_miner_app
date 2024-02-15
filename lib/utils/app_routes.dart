import 'package:db_miner_app/screen/detail/view/detail_screen.dart';
import 'package:db_miner_app/screen/home/view/home_screen.dart';
import 'package:db_miner_app/screen/like/view/like_Screen.dart';
import 'package:db_miner_app/screen/quotes%20detail/view/quotes_detail_screen.dart';
import 'package:db_miner_app/screen/splash/view/splash_scree.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> app_routes={
  '/':(context) => const SplashScreen(),
  'home':(context) => const HomeScreen(),
  'detail':(context) => const DetailScreen(),
  'quotesdetail':(context) => const QuotesDetailScreen(),
  'like': (context) => const LikeScreen(),
};