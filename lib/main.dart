import 'package:e_com_app_firebase/screens/dash_board_page.dart';
import 'package:e_com_app_firebase/screens/explore_product.dart';
import 'package:e_com_app_firebase/screens/home_page.dart';
import 'package:e_com_app_firebase/screens/my_cart.dart';
import 'package:e_com_app_firebase/start_screen/login_page.dart';
import 'package:e_com_app_firebase/start_screen/sign_up_page.dart';
import 'package:e_com_app_firebase/start_screen/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}

