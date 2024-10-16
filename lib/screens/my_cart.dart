import 'package:e_com_app_firebase/widget_constant/color_const.dart';
import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  MediaQueryData? mqData;

  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.mColor[0].withOpacity(0.5),
        automaticallyImplyLeading: false,
        title: Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: ColorConst.mColor[0].withOpacity(0.5),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (_, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 10),
                height: mqData!.size.height * 0.25,
                width: mqData!.size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //product image
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(17),
                        // height: mqData!.size.height * 0.2,
                        // width: mqData!.size.width * 0.25,
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
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Product name
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  Icons.delete_outline_rounded,
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
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
