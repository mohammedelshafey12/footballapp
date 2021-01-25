import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footballapp/Ui/Screens/OnBoarding.dart';
import 'package:footballapp/Ui/Screens/login.dart';
import 'package:footballapp/utils/colors_file.dart';
import 'dart:async';
import 'package:footballapp/utils/navigator.dart';

// ignore: camel_case_types
class SplashScreen extends StatefulWidget {
  @override
  _openState createState() => _openState();
}

// ignore: camel_case_types
class _openState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      navigateAndClearStack(context,Login());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryAppColor,
      body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("images/football-player-setting-ball.svg",color: blackColor,height: 100,),
              SizedBox(height: 20),
              Text("FootBall",style: TextStyle(color:blackColor,fontSize: 40 ),),
            ],
          )
      ),
    );
  }
}
