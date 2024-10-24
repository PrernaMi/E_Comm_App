import 'dart:io';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_com_app_firebase/screens/dashboard/product_bloc/product_bloc.dart';
import 'package:e_com_app_firebase/screens/dashboard/product_bloc/product_event.dart';
import 'package:e_com_app_firebase/screens/dashboard/product_bloc/product_state.dart';
import 'package:e_com_app_firebase/widget_constant/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../category_bloc/category_bloc.dart';
import '../category_bloc/category_events.dart';
import '../category_bloc/category_states.dart';
import '../navigations/explore_product.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MediaQueryData? mqData;

  List<String> mBannerList = [
    "assets/images/banner/banner.png",
    "assets/images/banner/banner2.png",
    "assets/images/banner/banner3.png",
    "assets/images/banner/banner 4.png",
  ];
  File? pickedFile;

  @override
  void initState() {
    context.read<CategoryBloc>().add(GetCategory());
    context.read<ProductBloc>().add(GetProduct());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child:
                CircleAvatar(child: Center(child: Icon(Icons.notifications))),
          )
        ],
      ),
      drawer: mDrawer(context: context),
      body: BlocBuilder<CategoryBloc, CategoryStates>(builder: (_, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ErrorState) {
          return Center(child: Text(state.errorMsg));
        }
        if (state is LoadedState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                    height: mqData!.size.height * 0.01,
                  ),
                  //slide banner listview
                  CarouselSlider(
                    options: CarouselOptions(
                      height: mqData!.size.height * 0.25,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                    ),
                    items: mBannerList.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                margin: EdgeInsets.only(right: 6),
                                width: mqData!.size.width * 0.9,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      i,
                                      fit: BoxFit.cover,
                                    )),
                              ));
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: mqData!.size.height * 0.02,
                  ),
                  //circle banner listview
                  SizedBox(
                    height: mqData!.size.height * 0.22,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.mCategory.data!.length,
                        itemBuilder: (_, index) {
                          return SizedBox(
                            width: mqData!.size.width * 0.22,
                            child: Column(
                              children: [
                                //banner image
                                Padding(
                                  padding: EdgeInsets.all(7),
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        "https://cdn.thewirecutter.com/wp-content/media/2024/03/androidphones-2048px-0803.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                //banner name
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    state.mCategory.data![index].name!,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey.shade400),
                        )
                      ],
                    ),
                  ),
                  //item grid
                  BlocBuilder<ProductBloc, ProductState>(builder: (_, mState) {
                    if (mState is PLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (mState is PErrorState) {
                      return Center(
                        child: Text(mState.errorMsg),
                      );
                    }
                    if (mState is ProductLoadedState) {
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300,
                                  childAspectRatio: 1 / 1),
                          itemCount: mState.mProduct.data!.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ExploreProduct(
                                    data: mState.mProduct.data![index],
                                  );
                                }));
                              },
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      height: mqData!.size.height * 0.3,
                                      decoration: BoxDecoration(
                                          color: ColorConst.mColor[0],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: EdgeInsets.all(13),
                                        child: Image.network(
                                          mState.mProduct.data![index].image!,
                                          height: 100,
                                          width: 100,
                                        ),
                                      )),
                                  Positioned(
                                    right: 5,
                                    top: 5,
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: ColorConst.mColor[1],
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10))),
                                        child: InkWell(
                                            onTap: () {},
                                            child: const Icon(
                                              Icons.star_border_outlined,
                                              color: Colors.white,
                                            ))),
                                  ),
                                  //Wireless Headphones
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 30.0),
                                      child: Text(
                                        mState.mProduct.data![index].name!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  //price and color pallet
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "\u{20B9}${mState.mProduct.data![index].price}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          //color pallet
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                color: Colors.deepOrange,
                                              ),
                                              Icon(
                                                Icons.circle,
                                                color: Colors.purpleAccent,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    }
                    return Container();
                  }),
                ],
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }

  Widget mDrawer({required BuildContext context}) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onTap: () {
                    try {
                      showModalBottomSheet(
                          isDismissible: false,
                          context: context,
                          builder: (_) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.24,
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        /*-----------Remove Sheet------*/
                                        InkWell(
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: CircleAvatar(
                                                child: Center(
                                                    child: Icon(
                                              Icons.close,
                                            )))),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        /*-----------Camera Picker------*/
                                        InkWell(
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          onTap: () async {
                                            final XFile? image =
                                                await ImagePicker().pickImage(
                                                    source: ImageSource.camera);
                                            if (image != null) {
                                              CroppedFile? croppedImage =
                                                  await ImageCropper()
                                                      .cropImage(
                                                          sourcePath:
                                                              image.path,
                                                          uiSettings: [
                                                    AndroidUiSettings(
                                                      toolbarTitle: 'Cropper',
                                                      toolbarColor: Colors
                                                          .deepOrange.shade400,
                                                      toolbarWidgetColor:
                                                          Colors.white,
                                                      aspectRatioPresets: [
                                                        CropAspectRatioPreset
                                                            .original,
                                                        CropAspectRatioPreset
                                                            .square,
                                                      ],
                                                    ),
                                                  ]);
                                              if (croppedImage != null) {
                                                pickedFile =
                                                    File(croppedImage.path);
                                                setState(() {});
                                                Navigator.pop(context);
                                              }
                                            }
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color:
                                                          Colors.grey.shade300),
                                                  child: Icon(
                                                    Icons.camera_alt_outlined,
                                                    size: 40,
                                                  )),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "Camera",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                        /*-----------Gallery Picker------*/
                                        InkWell(
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          onTap: () async {
                                            final XFile? image =
                                                await ImagePicker().pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            if (image != null) {
                                              CroppedFile? croppedImage =
                                                  await ImageCropper()
                                                      .cropImage(
                                                          sourcePath:
                                                              image.path,
                                                          uiSettings: [
                                                    AndroidUiSettings(
                                                      aspectRatioPresets: [
                                                        CropAspectRatioPreset
                                                            .original,
                                                        CropAspectRatioPreset
                                                            .square,
                                                      ],
                                                    ),
                                                  ]);
                                              if (croppedImage != null) {
                                                pickedFile =
                                                    File(croppedImage.path);

                                                setState(() {});
                                                Navigator.pop(context);
                                              }
                                            }
                                          },
                                          child: Column(
                                            children: [
                                              Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color:
                                                          Colors.grey.shade300),
                                                  child: Icon(
                                                    Icons.photo,
                                                    size: 40,
                                                  )),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "Gallery",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    } catch (e) {
                      rethrow;
                    }
                  },
                  child: pickedFile != null
                      ? Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey.shade400),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.file(pickedFile!,fit: BoxFit.cover,)),
                        )
                      : CircleAvatar(
                          radius: 25,
                        ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("prernamittal440@gmail.com"),
                    Text("Prerna Mittal"),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
