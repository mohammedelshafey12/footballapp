import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:footballapp/utils/colors_file.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 30,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              onDetailsPressed: () => debugPrint('hello'),
              accountName: Text("Nader " "Salah"),
              accountEmail: Text("nadersalah20201111@gmail.com"),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/backGroundDrawer.jpg",
                    ),
                    alignment: Alignment(.5, 0),
                    fit: BoxFit.cover),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/playerImage.jpg"),
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 0),
              color: greyPrimaryColor,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.home, color: whiteColor),
                    title: Text(
                      'الصفحة الرئيسية',
                      style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold,fontFamily: 'custom_font'),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                      leading: Icon(Icons.person, color: whiteColor),
                      title: Text(
                        'الصفحة الشخصية',
                        style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold,fontFamily: 'custom_font'),
                      ),
                      onTap: () {
                      }),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.phone, color: whiteColor),
                    title: Text(
                      'اتصل بنا',
                      style: TextStyle(color:whiteColor,fontWeight: FontWeight.bold,fontFamily: 'custom_font'),
                    ),
                    onTap: () {
                      launch("tel://5050");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: whiteColor),
                    title: Text(
                      'الاعدادات',
                      style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold,fontFamily: 'custom_font'),
                    ),
                    onTap: () {
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.help, color: whiteColor),
                    title: new RichText(
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text: 'المساعدة',
                            style: new TextStyle(
                                color: whiteColor, fontWeight: FontWeight.bold,fontFamily: 'custom_font'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.power_settings_new, color: Colors.red),
                    title: Text(
                      'تسجيل الخروج',
                      style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold,fontFamily: 'custom_font'),
                    ),
                    onTap: () {
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
