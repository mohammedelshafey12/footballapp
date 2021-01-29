import 'package:flutter/material.dart';
import 'package:footballapp/Ui/Screens/create_team.dart';
import 'package:footballapp/Ui/Screens/join_team.dart';
import 'package:footballapp/utils/colors_file.dart';
import 'package:footballapp/utils/navigator.dart';

class Team extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
          backgroundColor: greyPrimaryColor,
          bottom: PreferredSize(
            preferredSize: Size.square(20),
            child: Container(
              // height: 200,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 30, left: 20),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "فريقك",
                          style: TextStyle(
                              color: whiteColor,
                              fontSize: 25,
                              fontFamily: 'custom_font'),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20,right: 20),
            child: Text(
              "انت لم تملك فريق بعد\n ولست منتمي الي اي فريق \n يمكنك الاختيار ادناة ان تكون فريقك الخاص او تنضم الي فريق",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: whiteColor,
                  fontSize: 25,
                  fontFamily: 'custom_font'),
            ),
          ),
          SizedBox(height: 50,),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height/4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      navigateAndKeepStack(context, CreateTeam());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width/1.5,
                      height: 80,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text(
                        "كون فريقك",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 25,
                            fontFamily: 'custom_font'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      navigateAndKeepStack(context, JoinTeam());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 80,
                      decoration: BoxDecoration(
                          color: whiteColor, borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "أنضم الي فريق",
                        style: TextStyle(
                            color: blackColor,
                            fontSize: 25,
                            fontFamily: 'custom_font'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
