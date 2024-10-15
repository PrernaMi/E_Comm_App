import 'package:e_com_app_firebase/widget_constant/color_const.dart';
import 'package:e_com_app_firebase/widget_constant/text_style.dart';
import 'package:flutter/material.dart';

class ExploreProduct extends StatefulWidget {
  @override
  State<ExploreProduct> createState() => _ExploreProductState();
}


class _ExploreProductState extends State<ExploreProduct> {
  MediaQueryData? mqData;
  bool isTapped1 = true;
  bool isTapped2 = false;
  bool isTapped3 = false;
  int index = 0;
  List<String> textDesc = [
    "Experience your favorite music with unparalleled sound quality using these wireless Bluetooth headphones. Designed with comfort and convenience in mind, these headphones feature cushioned ear cups, an adjustable headband, and a lightweight design perfect for long listening sessions. The over-ear design provides excellent noise isolation, while the advanced Bluetooth technology ensures a stable, high-quality connection with a range of up to 33 feet. Whether you're commuting, working out, or just relaxing, these headphones offer the freedom of wireless audio without compromising on sound clarity. With intuitive touch controls on the ear cups, you can easily adjust volume, skip tracks, or take calls, all without reaching for your device.",
    "This is Specifications",
    "This is Review"
  ];

  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: ColorConst.mColor[0],
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Stack(
                  children: [
                    //image container
                    SizedBox(
                        height: mqData!.size.height * 0.47,
                        width: mqData!.size.width,
                        child: Image.asset(
                          "assets/headphone.png",
                        )),
                    //app bar row
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: CircleAvatar(
                              child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      size: 16,
                                    )),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: CircleAvatar(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.share, size: 16))),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: CircleAvatar(
                                child: IconButton(
                                    onPressed: () {},
                                    icon:
                                        Icon(Icons.star_border_outlined, size: 20))),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                //product details
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                        width: mqData!.size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Wireless Headphone",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "\$520.00",
                                style: TextStyleConst.mTextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  //Review Container
                                  Container(
                                    height: 23,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: ColorConst.mColor[1],
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "4.8",
                                          style: TextStyleConst.mTextStyle(
                                              color: Colors.white, fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "(320 Review)",
                                    style: TextStyleConst.mTextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                  Expanded(
                                      child: SizedBox(
                                    width: 0,
                                  )),
                                  RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text: "Seller: ",
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                    TextSpan(
                                        text: "Tariqual islam",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18))
                                  ]))
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Color",
                                style: TextStyleConst.mTextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              //color pallet
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.red.shade800,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.blue.shade900,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.brown.shade900,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.grey.shade400,
                                    size: 30,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              //content selection text
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        isTapped1 = true;
                                        isTapped2 = false;
                                        isTapped3 = false;
                                        index = 0;
                                        setState(() {});
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: isTapped1
                                                ? ColorConst.mColor[1]
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Center(child: Text("Description")))),
                                  InkWell(
                                      onTap: () {
                                        isTapped2 = true;
                                        isTapped1 = false;
                                        isTapped3 = false;
                                        index = 1;
                                        setState(() {});
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: isTapped2
                                                  ? ColorConst.mColor[1]
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child:
                                              Center(child: Text("Specifications")))),
                                  InkWell(
                                      onTap: () {
                                        isTapped3 = true;
                                        isTapped1 = false;
                                        isTapped2 = false;
                                        index = 2;
                                        setState(() {});
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: isTapped3
                                                  ? ColorConst.mColor[1]
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(child: Text("Reviews")))),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                textDesc[index],
                                style: TextStyleConst.mTextStyle(
                                    color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
           alignment: Alignment.bottomCenter,
            child: Container(
              height: mqData!.size.height*0.1,
              width: mqData!.size.width*0.8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(40),
              ),
              child: LayoutBuilder(
                builder: (_,constraints) {
                  return Row(
                    children: [
                      SizedBox(width: 20,),
                      Container(
                        height: constraints.maxHeight*0.63,
                        width: constraints.maxWidth*0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.white,width: 2)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.remove,color: Colors.white,size: 20,),
                            Text("1",style: TextStyle(color: Colors.white),),
                            Icon(Icons.add,color: Colors.white,size: 20,)
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox(width: 0,)),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: constraints.maxHeight*0.63,
                        width: constraints.maxWidth*0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: ColorConst.mColor[1],
                        ),
                        child: Center(
                          child: Text("Add to Cart",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),),
                        )
                      )
                    ],
                  );
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}
