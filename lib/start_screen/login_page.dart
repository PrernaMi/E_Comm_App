import 'package:e_com_app_firebase/start_screen/sign_up_page.dart';
import 'package:e_com_app_firebase/widget_constant/color_const.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  MediaQueryData?mqData;
  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome Back",style: TextStyle(fontFamily: 'Main',fontSize: 40),),
            Text("Enter your credential for login"),
            SizedBox(height: mqData!.size.height*0.12,),
            //username textfield
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
                    borderSide: BorderSide.none
                  )
                ),
              ),
            ),
            SizedBox(height: 15,),
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
                        borderSide: BorderSide.none
                    )
                ),
              ),
            ),
            SizedBox(height: 15,),
            //login now
            InkWell(
              onTap: (){},
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Container(
                height: mqData!.size.height*0.07,
                width: mqData!.size.width*0.9,
                decoration: BoxDecoration(
                  color: ColorConst.mColor[1],
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Center(child: Text("Login Now",style: TextStyle(fontFamily: 'Main',color: Colors.white),)),
              ),
            ),
            SizedBox(height: mqData!.size.height*0.14,),
            //forgot password
            InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
              onTap: (){},
                child: Text("Forgot password?",style: TextStyle(fontFamily: 'Main',color: ColorConst.mColor[1].withBlue(6)),)),
            SizedBox(height: mqData!.size.height*0.1,),
            //Navigate to sign up
            InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return SignUpPage();
                }));
              },
              child: RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Don't have an account?  ",
                    style:TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: "Sign Up",
                    style: TextStyle(color: ColorConst.mColor[1],fontWeight: FontWeight.bold)
                  )
                ]
              )),
            ),
          ],
        ),
      ),
    );
  }
}