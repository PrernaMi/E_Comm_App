import 'package:e_com_app_firebase/data/remote/api_helper.dart';
import 'package:e_com_app_firebase/data/repos/app_repository.dart';
import 'package:e_com_app_firebase/provider/get_totoal_provider.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/decrease_quantity_bloc/desc_bloc.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/delete_cart_bloc/del_cart_bloc.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/cart/view_cart_bloc/view_cart_bloc.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/home_page/category_bloc/category_bloc.dart';
import 'package:e_com_app_firebase/screens/dashboard/navigations/home_page/profile_bloc/profile_bloc.dart';
import 'package:e_com_app_firebase/screens/dashboard/product_bloc/product_bloc.dart';
import 'package:e_com_app_firebase/screens/start_screen/login_user/bloc/login_bloc.dart';
import 'package:e_com_app_firebase/screens/start_screen/register_user/bloc/register_bloc.dart';
import 'package:e_com_app_firebase/screens/start_screen/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context){
      return RegisterBloc(appRepo: AppRepo(apiHelper: ApiHelper()));
    }),
    BlocProvider(create: (context){
      return LoginBloc(appRepo: AppRepo(apiHelper: ApiHelper()));
    }),
    BlocProvider(create: (context){
      return CategoryBloc(appRepo: AppRepo(apiHelper: ApiHelper()));
    }),
    BlocProvider(create: (context){
      return ProductBloc(appRepo: AppRepo(apiHelper: ApiHelper()));
    }),
    BlocProvider(create: (context){
      return AddToCartBloc(appRepo: AppRepo(apiHelper: ApiHelper()));
    }),
    ChangeNotifierProvider(create: (context){
      return GetTotalProvider();
    }),
    BlocProvider(create: (context){
      return DecreaseProductBloc(appRepo: AppRepo(apiHelper: ApiHelper()));
    }),
    BlocProvider(create: (context){
      return ProfileBloc(appRepo: AppRepo(apiHelper: ApiHelper()));
    }),
    BlocProvider(create: (context){
      return ViewCartBloc(appRepo: AppRepo(apiHelper: ApiHelper()));
    }),
    BlocProvider(create: (context){
      return DelCartBloc(appRepo: AppRepo(apiHelper: ApiHelper()));
    }),
  ], child: MyApp()));
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

