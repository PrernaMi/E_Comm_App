import 'package:e_com_app_firebase/main.dart';
import 'package:e_com_app_firebase/provider/bottom_sheet_visible.dart';
import 'package:e_com_app_firebase/provider/get_totoal_provider.dart';
import 'package:e_com_app_firebase/screens/dashboard/dash_board_page.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/add_to_cart_bloc/add_to_cart_events.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/add_to_cart_bloc/add_to_cart_states.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/decrease_quantity_bloc/dec_state.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/decrease_quantity_bloc/desc_bloc.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/delete_cart_bloc/del_cart_bloc.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/delete_cart_bloc/del_cart_event.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/view_cart_bloc/view_cart_bloc.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/view_cart_bloc/view_cart_events.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/view_cart_bloc/view_cart_states.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/explore_product.dart';
import 'package:e_com_app_firebase/widget_constant/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'decrease_quantity_bloc/desc_event.dart';

class MyCart extends StatefulWidget {
  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  MediaQueryData? mqData;
  TextEditingController coupenController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  bool _showBottomSheet = false;

  @override
  void initState() {
    context.read<ViewCartBloc>().add(GetViewCart());
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent
        ? _showBottomSheet = true
        : _showBottomSheet = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ColorConst.mColor[0].withOpacity(0.5),
          leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
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
        body: BlocConsumer<ViewCartBloc, ViewCartState>(
          listener: (_,state){
            if(state is ViewCartLoadedState){
              context.read<GetTotalProvider>().calculateAmt(totalList: state.viewCartModel);
            }
          },
            builder: (_, state) {

          if (state is ViewCartLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ViewCartErrorState) {
            return Center(child: Text(state.errorMsg));
          }
          if (state is ViewCartLoadedState) {
            return state.viewCartModel.data != null
                ? Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: mqData!.size.height * 0.32,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: ListView.builder(
                              controller: _scrollController,
                              itemCount: state.viewCartModel.data!.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  height: mqData!.orientation ==
                                          Orientation.portrait
                                      ? mqData!.size.height * 0.17
                                      : mqData!.size.height * 0.4,
                                  width: mqData!.size.width * 0.8,
                                  decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //product image
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          margin: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: ColorConst.mColor[0]
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Center(
                                              child: Padding(
                                            padding: EdgeInsets.all(15),
                                            child: Image.network(state
                                                .viewCartModel
                                                .data![index]
                                                .image!),
                                          )),
                                        ),
                                      ),
                                      //product detail
                                      Expanded(
                                        flex: 5,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 8.0, right: 8, bottom: 8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //Product name
                                              Expanded(
                                                flex: 2,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        state.viewCartModel
                                                            .data![index].name!,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        context.read<DecreaseProductBloc>().add(DescreaseProduct(
                                                                    mBody: {
                                                                  "product_id": state
                                                                      .viewCartModel
                                                                      .data![
                                                                          index]
                                                                      .productId,
                                                                  "quantity": state
                                                                      .viewCartModel
                                                                      .data![
                                                                          index]
                                                                      .quantity,
                                                                }));
                                                        context.read<GetTotalProvider>().calculateAmt(totalList: state.viewCartModel);
                                                        setState(() {});
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(SnackBar(
                                                                content: Text(
                                                                    "Product removed from cart successfully!!!!")));
                                                      },
                                                      child: Icon(
                                                        Icons.delete,
                                                        color:
                                                            Colors.red.shade400,
                                                      ),
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
                                                      color:
                                                          Colors.grey.shade400,
                                                      fontSize: 16),
                                                ),
                                              ),
                                              //price and count
                                              Expanded(
                                                flex: 1,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "\u{20B9}${state.viewCartModel.data![index].price}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                    //increment count
                                                    Container(
                                                      height: 30,
                                                      width: 90,
                                                      decoration: BoxDecoration(
                                                          color: ColorConst
                                                              .mColor[0]
                                                              .withOpacity(0.5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          border: Border.all(
                                                              color: ColorConst
                                                                  .mColor[0])),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          BlocListener<
                                                                  DecreaseProductBloc,
                                                                  DescQtyState>(
                                                              listener:
                                                                  (BuildContext
                                                                          context,
                                                                      state) {
                                                                if (state
                                                                    is DescQtyInitialState) {
                                                                  Center(
                                                                      child:
                                                                          CircularProgressIndicator());
                                                                }
                                                                if (state
                                                                    is DescQtyErrorState) {
                                                                  Center(
                                                                      child: Text(
                                                                          state
                                                                              .errorMsg));
                                                                }
                                                                if (state
                                                                    is DescQtyLoadedState) {
                                                                  context
                                                                      .read<
                                                                          ViewCartBloc>()
                                                                      .add(
                                                                          GetViewCart());
                                                                }
                                                              },
                                                              child: InkWell(
                                                                  onTap: () {
                                                                    context
                                                                        .read<
                                                                            DecreaseProductBloc>()
                                                                        .add(DescreaseProduct(
                                                                            mBody: {
                                                                              "product_id": state.viewCartModel.data![index].productId,
                                                                              "quantity": 1
                                                                            }));
                                                                    context.read<GetTotalProvider>().calculateAmt(totalList: state.viewCartModel);
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    size: 20,
                                                                  ))),
                                                          Text(
                                                            "${state.viewCartModel.data![index].quantity!}",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          BlocListener<
                                                                  AddToCartBloc,
                                                                  AddToCartStates>(
                                                              listener:
                                                                  (_, mState) {
                                                                if (mState
                                                                    is AddToCartLoading) {
                                                                  Center(
                                                                      child:
                                                                          CircularProgressIndicator());
                                                                }
                                                                if (mState
                                                                    is AddToCartError) {
                                                                  Center(
                                                                      child: Text(
                                                                          mState
                                                                              .errormsg));
                                                                }
                                                                if (mState
                                                                    is AddToCartLoading) {
                                                                  context
                                                                      .read<
                                                                          ViewCartBloc>()
                                                                      .add(
                                                                          GetViewCart());
                                                                }
                                                              },
                                                              child: InkWell(
                                                                onTap: () {
                                                                  context.read<AddToCartBloc>().add(AddToCart(
                                                                      count: 1,
                                                                      product_id: state
                                                                          .viewCartModel
                                                                          .data![
                                                                              index]
                                                                          .productId!));
                                                                  context.read<GetTotalProvider>().calculateAmt(totalList: state.viewCartModel);
                                                                },
                                                                child: Icon(
                                                                  Icons.add,
                                                                  size: 20,
                                                                ),
                                                              ))
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
                      ),
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          "assets/images/empty_cart.json",
                          height: 200,
                          width: 200,
                        ),
                        Text(
                          "Empty Cart!",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                              fontFamily: "Main"),
                        )
                      ],
                    ),
                  );
          }
          return Container();
        }),
        bottomSheet: _showBottomSheet ||
                mqData!.orientation == Orientation.portrait
            ? Container(
                height: mqData!.orientation == Orientation.portrait
                    ? mqData!.size.height * 0.32
                    : mqData!.size.height * 0.64,
                width: mqData!.size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    children: [
                      TextField(
                        controller: coupenController,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            hintText: "Enter Discount Code",
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                            suffix: InkWell(
                              onTap: () {},
                              child: Text(
                                "Apply",
                                style: TextStyle(
                                  color: ColorConst.mColor[1],
                                  fontFamily: "Main",
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 240, 241, 245),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\u{20B9}${context.watch<GetTotalProvider>().getAmt()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Colors.grey.shade400))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\u{20B9}${context.watch<GetTotalProvider>().getAmt()}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      Flexible(
                        child: Container(
                          height: 50,
                          width: mqData!.size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ColorConst.mColor[1]),
                          child: Center(
                              child: FittedBox(
                                  child: Text(
                            "Checkout",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ))),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : null);
  }

}
