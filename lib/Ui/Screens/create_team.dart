import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footballapp/Ui/Widgets/customTextFormField.dart';
import 'package:footballapp/Ui/Widgets/custom_home_drawer.dart';
import 'package:footballapp/utils/colors_file.dart';

class CreateTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          "أختر فريقك",
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
      backgroundColor: blackColor,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                    child: Image.asset(
                  "images/playground.jpg",
                )),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 12),
                      child: Container(
                        alignment: Alignment.center,
                        child: Player(
                          position: "مهاجم",
                          name: "Ahmed Mohamed",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Player(
                              position: "خط وسط",
                              name: "Ahmed Mohamed",
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Player(
                              position: "خط وسط",
                              name: "Ahmed Mohamed",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Player(
                              position: "مدافع",
                              name: "Ahmed Mohamed",
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Player(
                              position: "مدافع",
                              name: "Ahmed Mohamed",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 80),
                      child: Container(
                        alignment: Alignment.center,
                        child: Player(
                          position: "حارس مرمي",
                          name: "Ahmed Mohamed",
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.green,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 9,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 130,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("images/playerAvatar.png"),
                                    radius: 25,
                                  ),
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("images/playerAvatar.png"),
                                    radius: 25,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "البدلاء",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 25,
                                  fontFamily: "custom_font"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Player extends StatelessWidget {
  String position, name;

  Player({this.position, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Color(0xff1D1D1D),
                    title: Center(
                      child: Text(
                        "اضافة لاعب",
                        style: TextStyle(
                            fontFamily: 'custom_font', color: Colors.white),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    actions: [
                      FlatButton(
                          onPressed: () {},
                          child: Text(
                            "اضافة",
                            style: TextStyle(fontFamily: 'custom_font'),
                          )),
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "الرجوع ",
                            style: TextStyle(fontFamily: 'custom_font'),
                          ))
                    ],
                    content: TextFormField(
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                        hintText: "ادخل اسم اللاعب",
                        hintStyle: TextStyle(
                          color: whiteColor
                        )
                      ),
                    )
                  );
                });
          },
          child: CircleAvatar(
            backgroundImage: AssetImage("images/playerAvatar.png"),
            radius: 25,
          ),
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: whiteColor, fontSize: 18, fontFamily: "custom_font"),
        ),
        Text(
          position,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: whiteColor, fontSize: 18, fontFamily: "custom_font"),
        )
      ],
    );
  }
}
