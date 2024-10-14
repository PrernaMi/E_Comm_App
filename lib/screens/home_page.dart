import 'package:e_com_app_firebase/screens/explore_product.dart';
import 'package:e_com_app_firebase/widget_constant/color_const.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  MediaQueryData? mqData;

  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 0,
              ),
              //search bar
              SizedBox(
                width: mqData!.size.width * 0.92,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorConst.mColor[0],
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Icon(
                          Icons.filter_list,
                          color: Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide.none)),
                ),
              ),
              SizedBox(
                height: mqData!.size.height * 0.03,
              ),
              //slide banner listview
              SizedBox(
                height: mqData!.size.height * 0.4,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/banner.png",
                              fit: BoxFit.cover,
                              width: mqData!.size.width * 0.92,
                            )),
                      );
                    }),
              ),
              SizedBox(
                height: mqData!.size.height * 0.03,
              ),
              //circle banner listview
              SizedBox(
                height: mqData!.size.height * 0.23,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return SizedBox(
                        width: mqData!.size.width * 0.2,
                        child: Column(
                          children: [
                            //banner image
                            Padding(
                              padding: EdgeInsets.all(7),
                              child: CircleAvatar(
                                  radius: 40,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      "assets/banner.png",
                                      fit: BoxFit.cover,
                                      height: 100,
                                    ),
                                  )),
                            ),
                            //banner name
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Flexible(
                                child: Text(
                                  "Shoes",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              //Special for you text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special for You",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                    Text(
                      "See all",
                      style:
                          TextStyle(fontSize: 15, color: ColorConst.mColor[0]),
                    )
                  ],
                ),
              ),
              //item grid
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250, childAspectRatio: 1 / 1),
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ExploreProduct();
                        }));
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              height: mqData!.size.height * 0.3,
                              decoration: BoxDecoration(
                                  color: ColorConst.mColor[0],
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          Positioned(
                            right:10,
                            top:10,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: ColorConst.mColor[1],
                               borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
                      ),
                              child: Icon(Icons.star_border_outlined,color: Colors.white,),
                                  ),
                            ),
                          Positioned(
                            left:70,
                              top: 40,
                              child: Image.asset("assets/headphone.png",height: 100,width: 100,)),
                          Positioned(
                            bottom: 15,
                            left: 15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(child: Text("Wireless Headphones",style: TextStyle(fontWeight: FontWeight.bold),)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(width: 5,),
                                    Text("\$120.00",style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(width: 30,),
                                    Row(
                                      children: [
                                        Icon(Icons.circle,color: Colors.black,),
                                        Icon(Icons.circle,color: Colors.blueAccent,),
                                        Icon(Icons.circle,color: Colors.deepOrange,),
                                        Icon(Icons.circle,color: Colors.purpleAccent,),
                                      ],
                                    ),
                                    ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: ColorConst.mColor[1],
        onPressed: () {},
        child: Icon(
          Icons.home_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
