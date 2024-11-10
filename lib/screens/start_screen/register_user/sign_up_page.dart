import 'package:e_com_app_firebase/main.dart';
import 'package:e_com_app_firebase/models/auth_model.dart';
import 'package:e_com_app_firebase/screens/start_screen/register_user/bloc/register_bloc.dart';
import 'package:e_com_app_firebase/screens/start_screen/register_user/bloc/register_events.dart';
import 'package:e_com_app_firebase/screens/start_screen/register_user/bloc/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widget_constant/color_const.dart';
import '../login_user/login_page.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  MediaQueryData? mqData;
  bool isLoading = false;

  TextEditingController nameController = TextEditingController();

  TextEditingController passController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign up",
              style: TextStyle(fontFamily: 'Main', fontSize: 40),
            ),
            Text("Create your account"),
            SizedBox(
              height: mqData!.size.height * 0.12,
            ),
            //username
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    fillColor: ColorConst.mColor[1].withOpacity(0.2),
                    filled: true,
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //email
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    fillColor: ColorConst.mColor[1].withOpacity(0.2),
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //phone
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(
                    fillColor: ColorConst.mColor[1].withOpacity(0.2),
                    filled: true,
                    prefixIcon: Icon(Icons.phone),
                    hintText: "Phone",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //password
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                obscureText: true,
                controller: passController,
                decoration: InputDecoration(
                    fillColor: ColorConst.mColor[1].withOpacity(0.2),
                    filled: true,
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //Sign up
            BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is LoadingState) {
                  isLoading = true;
                  setState(() {

                  });
                }
                if(state is ErrorState){
                  isLoading = false;
                  setState(() {

                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.errorMsg)));
                }
                if (state is SuccessState) {
                  isLoading = false;
                  setState(() {

                  });
                  Navigator.pop(context);
                }
              },
              child: InkWell(
                onTap: () {
                  if(nameController.text.toString() == "" || emailController.text.toString() == ""||
                  passController.text.toString() == "" || phoneController.text.toString() == ""){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all required fields...")));
                  }else{
                    context.read<RegisterBloc>().add(UserRegisterEvent(
                        bodyParams: RegisterModel(
                            name: nameController.text.toString(),
                            email: emailController.text.toString(),
                            phone: phoneController.text.toString(),
                            password: passController.text.toString())
                            .toMap()));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("User Register Successfully..")));
                  }
                },
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Container(
                  height: mqData!.size.height * 0.07,
                  width: mqData!.size.width * 0.9,
                  decoration: BoxDecoration(
                      color: ColorConst.mColor[1],
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                          child: isLoading ? CircularProgressIndicator() :Text(
                            "Sign up",
                            style: TextStyle(
                                fontFamily: 'Main', color: Colors.white),
                          )
                      )),
                ),
            ),
            SizedBox(
              height: mqData!.size.height * 0.14,
            ),
            //Navigate to login
            InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
              },
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "Already have an account?  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    TextSpan(
                        text: "Login",
                        style: TextStyle(
                            color: ColorConst.mColor[1],
                            fontWeight: FontWeight.bold))
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
