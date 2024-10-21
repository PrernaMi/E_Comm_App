import 'package:e_com_app_firebase/data/remote/api_helper.dart';
import 'package:e_com_app_firebase/data/repos/app_repository.dart';
import 'package:e_com_app_firebase/provider/bottom_sheet_visible.dart';
import 'package:e_com_app_firebase/screens/dashboard/bloc/product_bloc.dart';
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
      return ProductBloc(appRepo: AppRepo(apiHelper: ApiHelper()));
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

