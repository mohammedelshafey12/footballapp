import 'package:flutter/material.dart';
import 'package:footballapp/utils/colors_file.dart';

Container onBoarding1(){
  return Container(
    child: Column(
      children: [
        // Center(
        //     child: Image.asset("images/loginOnBoard.png",height: 200,),
        // ),
        SizedBox(height: 36.8),
        Container(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              Text(
                "سجل دخول بايميلك ",
                style: TextStyle(color: whiteColor, fontSize: 25,fontFamily: 'custom_font'),
              ),
              SizedBox(height: 17),
              Text(
                "يمكنك الان التسجيل في الابلكيشن الخاص بنا.",
                textAlign: TextAlign.center,
                style: TextStyle(color: whiteColor, fontSize: 14,fontFamily: 'custom_font'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
