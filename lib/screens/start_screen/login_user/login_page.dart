import 'package:e_com_app_firebase/main.dart';
import 'package:e_com_app_firebase/models/auth_model.dart';
import 'package:e_com_app_firebase/screens/dashboard/dash_board_page.dart';
import 'package:e_com_app_firebase/screens/start_screen/login_user/bloc/login_bloc.dart';
import 'package:e_com_app_firebase/screens/start_screen/login_user/bloc/login_event.dart';
import 'package:e_com_app_firebase/screens/start_screen/login_user/bloc/login_states.dart';
import 'package:e_com_app_firebase/screens/start_screen/register_user/sign_up_page.dart';
import 'package:e_com_app_firebase/widget_constant/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  MediaQueryData? mqData;

  SharedPreferences? prefs;

  bool isLoaded = false;

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
              "Welcome Back",
              style: TextStyle(fontFamily: 'Main', fontSize: 40),
            ),
            Text("Enter your credential for login"),
            SizedBox(
              height: mqData!.size.height * 0.12,
            ),
            //email textfield
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
            //password textfield
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: passController,
                obscureText: true,
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
            // login now
            BlocListener<LoginBloc,LoginState>(
              listener: (context, state) {
                if (state is LoadingState) {
                  isLoaded = true;
                  setState(() {

                  });
                }
                if(state is ErrorState){
                  isLoaded = false;
                  setState(() {

                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.errorMsg)));
                }
                if (state is SuccessState) {
                  isLoaded = false;
                  setState(() {

                  });
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return DashBoardPage();
                  }));
                }
              },
              child: InkWell(
                onTap: () async {
                  if(emailController.text.toString() == "" || passController.text.toString() == ""){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all required fields...")));
                  }else{
                    context.read<LoginBloc>().add(LoginUserEvent(
                        mBody: LoginModel(
                            email: emailController.text.toString(),
                            password: passController.text.toString())
                            .toMap()));
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
                      child: isLoaded?CircularProgressIndicator():Text(
                        "Login Now",
                        style: TextStyle(fontFamily: 'Main', color: Colors.white),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: mqData!.size.height * 0.14,
            ),
            //forgot password
            InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                      fontFamily: 'Main',
                      color: ColorConst.mColor[1].withBlue(6)),
                )),
            SizedBox(
              height: mqData!.size.height * 0.1,
            ),
            //Navigate to sign up
            InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUpPage();
                }));
              },
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "Don't have an account?  ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                TextSpan(
                    text: "Sign Up",
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
