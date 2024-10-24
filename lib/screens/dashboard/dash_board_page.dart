import 'package:e_com_app_firebase/widget_constant/color_const.dart';
import 'package:flutter/material.dart';
import 'home_page/home_page.dart';
import 'navigations/cart/my_cart.dart';

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
        child: NavigationBar(
          indicatorColor: ColorConst.mColor[1].withOpacity(0.5),
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.star_border_outlined),
                selectedIcon: Icon(Icons.star),
                label: "Favourite"),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined),
                selectedIcon: Icon(Icons.shopping_cart_rounded),
                label: "My Cart"),
            NavigationDestination(
                icon: Icon(Icons.perm_identity),
                selectedIcon: Icon(Icons.person),
                label: "My Account"),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            selectedIndex = value;
            setState(() {});
          },
        ),
      ),
      );
  }
}
