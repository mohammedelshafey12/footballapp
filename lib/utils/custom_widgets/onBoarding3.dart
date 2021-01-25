import 'package:flutter/material.dart';
import 'package:footballapp/utils/colors_file.dart';


Container onBoarding3(){
  return Container(
    child: Column(
      children: [
        // Center(
        //     child: Image.asset("images/ticketOnBoard.png",height: 200,),
        // ),
        SizedBox(height: 36.8),
        Container(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              Text(
                "Get Your Ticket",
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