import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footballapp/Ui/Widgets/customTextFormField.dart';
import 'package:footballapp/Ui/Widgets/custom_home_drawer.dart';
import 'package:footballapp/utils/colors_file.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: greyPrimaryColor,
          bottom: PreferredSize(
            preferredSize: Size.square(100),
            child: Container(
              // height: 200,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 30, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  color: whiteColor,
                                  size: 30,
                                ),
                                onPressed: (){
                                  Scaffold.of(context).openDrawer();
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: whiteColor,
                              backgroundImage:
                                  AssetImage("images/playerImage.jpg"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.notifications_active_sharp,
                              color: whiteColor,
                            ),
                          ],
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "اخر التحديثات",
                              style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 25,
                                  fontFamily: 'custom_font'),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: whiteColor, height: .8),
                      cursorColor: whiteColor,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.withOpacity(.1),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'أبحث عن المباريات',
                          prefixIcon: Icon(
                            Icons.search,
                            color: whiteColor,
                          ),
                          hintStyle: TextStyle(
                              color: whiteColor.withOpacity(.5),
                              fontFamily: 'custom_font',
                              fontSize: 13)),
                    ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        maxLines: 4,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: whiteColor, height: .8),
                        cursorColor: whiteColor,
                        textAlign: TextAlign.end,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.withOpacity(.1),
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                            hintText: '. . . أكتب شيْ ما',
                            hintStyle: TextStyle(
                                color: whiteColor.withOpacity(.5),
                                fontFamily: 'custom_font',
                                fontSize: 13)),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "مباريات اليوم",
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 25,
                            fontFamily: 'custom_font'),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 167,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 200,
                            // padding: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage("images/carosal-1.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "اخر النشاطات",
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 25,
                            fontFamily: 'custom_font'),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        // color: greyPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: greyPrimaryColor)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage("images/playerImage.jpg"),
                          ),
                          title: Text(
                            "@AhmedSalem",
                            style: TextStyle(color: whiteColor),
                          ),
                          subtitle: Text("2 hours ago",
                              style: TextStyle(color: grey)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "#winner",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  Text(
                                    ", ",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  Text(
                                    "#super",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ultricies orci eu vehicula dictum. Sed venenatis",
                                style: TextStyle(color: whiteColor),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "images/heart.svg",
                                          color: Colors.red,
                                          width: 22,
                                          height: 22,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Like",
                                          style: TextStyle(color: whiteColor),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.share,
                                          color: whiteColor,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Share",
                                          style: TextStyle(color: whiteColor),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
