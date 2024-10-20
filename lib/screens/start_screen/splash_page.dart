import 'dart:async';
import 'package:e_com_app_firebase/screens/dash_board_page.dart';
import 'package:e_com_app_firebase/screens/start_screen/login_user/login_page.dart';
import 'package:e_com_app_firebase/widget_constant/app_constants.dart';
import 'package:e_com_app_firebase/widget_constant/color_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  SharedPreferences? prefs;

  @override
  void initState() {
    nextPage();
    super.initState();
  }

  Widget nextScreen = DashBoardPage();

  void nextPage() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs!.getString(AppConst.Prefs_UID_tokan) == null ||
        prefs!.getString(AppConst.Prefs_UID_tokan) == "") {
      nextScreen = LoginPage();
    }
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return nextScreen;
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.mColor[2],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/images/splash.json",
              height: 200,
              width: 200,
            ),
            Text(
              "Unlock the Best Deals Today!",
              style: TextStyle(
                  color: Colors.deepOrange, fontSize: 20, fontFamily: "Main"),
            )
          ],
        ),
      ),
    );
  }
}
