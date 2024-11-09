import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_com_app_firebase/widget_constant/app_constants.dart';
import 'package:e_com_app_firebase/widget_constant/color_const.dart';
import 'package:flutter/material.dart';
import 'navigations/cart/my_cart.dart';
import 'navigations/home_page/home_page.dart';

class DashBoardPage extends StatefulWidget {

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  List<Widget> bottomSheetWidget = [
    HomePage(),
    Container(),
    MyCart(),
    Container()
  ];

  @override
  void initState() {
    super.initState();
  }
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: bottomSheetWidget[selectedIndex],
      bottomNavigationBar:SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: CurvedNavigationBar(
          backgroundColor: ColorConst.mColor[2],
          items: [
          Icon(Icons.home_outlined),
          Icon(Icons.star_border_outlined),
          Icon(Icons.shopping_cart_outlined),
          Icon(Icons.perm_identity)
        ],
        height: 65,
        animationCurve: Curves.easeIn,
        index: selectedIndex,
        onTap: (value){
          selectedIndex = value;
            setState(() {});
        },),
      ),
      );
  }
}
