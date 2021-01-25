import 'package:flutter/material.dart';
import 'package:footballapp/utils/colors_file.dart';


Container onBoarding2(){
  return Container(
    child: Column(
      children: [
        // Center(
        //     child: Image.asset("images/onBoarding2.png",height: 200,),
        // ),
        SizedBox(height: 36.8),
        Container(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Column(
            children: [
              Text(
                "Browse Available Excursions",
                style: TextStyle(color: whiteColor, fontSize: 25),
              ),
              SizedBox(height: 17),
              Text(
                "It is a long established fact that a reader will be distracted by the readable.",
                textAlign: TextAlign.center,
                style: TextStyle(color: whiteColor, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}