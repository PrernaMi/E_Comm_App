import 'package:e_com_app_firebase/main.dart';
import 'package:e_com_app_firebase/provider/bottom_sheet_visible.dart';
import 'package:e_com_app_firebase/screens/dashboard/dash_board_page.dart';
import 'package:e_com_app_firebase/screens/navigations/home_page.dart';
import 'package:e_com_app_firebase/widget_constant/color_const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  MediaQueryData? mqData;

  TextEditingController coupenController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorConst.mColor[0].withOpacity(0.5),
        leading: InkWell(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return DashBoardPage();
            }));
          },
          child: CircleAvatar(
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: ColorConst.mColor[0].withOpacity(0.5),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListView.builder(
                itemCount: 16,
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: mqData!.size.height * 0.17,
                    width: mqData!.size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //product image
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: ColorConst.mColor[0].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Image.asset("assets/images/headphone.png"),
                            )),
                          ),
                        ),
                        //product detail
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding:  EdgeInsets.only(top: 8.0,right: 8,bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Product name
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Wireless Headphone",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Icon(
                                        Icons.delete,
                                        color: Colors.red.shade400,
                                      )
                                    ],
                                  ),
                                ),
                                //Category name
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Electronics",
                                    style: TextStyle(
                                        color: Colors.grey.shade400, fontSize: 16),
                                  ),
                                ),
                                //price and count
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$70.00",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                      //increment count
                                      Container(
                                        height: 30,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            color:
                                                ColorConst.mColor[0].withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                                color: ColorConst.mColor[0])),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                                onTap: () {},
                                                child: Icon(
                                                  Icons.remove,
                                                  size: 20,
                                                )),
                                            Text(
                                              "1",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.add,
                                                size: 20,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: mqData!.size.height*0.32,
              width: mqData!.size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                child: Column(
                  children: [
                    TextField(
                      controller: coupenController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        hintText: "Enter Discount Code",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                        ),
                        suffix: InkWell(
                          onTap: (){},
                          child: Text("Apply",style: TextStyle(
                            color: ColorConst.mColor[1],
                            fontFamily: "Main",
                          ),),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 240,241,245),
                        border:OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        )
                      ),
                    ),
                    SizedBox(height: 14,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal",style: TextStyle(color: Colors.grey.shade400,fontSize: 17,fontWeight: FontWeight.bold),),
                        Text("\$246.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey.shade400))
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        Text("\$246.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)
                      ],
                    ),
                    SizedBox(height: 19,),
                    Flexible(
                      child: Container(
                        height: 50,
                        width: mqData!.size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ColorConst.mColor[1]
                        ),
                        child: Center(child: FittedBox(child: Text("Checkout",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),))),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
