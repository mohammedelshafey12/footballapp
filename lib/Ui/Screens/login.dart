import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:footballapp/Provider/modelHud.dart';
import 'package:footballapp/Services/auth.dart';
import 'package:footballapp/Ui/Screens/Register.dart';
import 'package:footballapp/Ui/Screens/home_page.dart';
import 'package:footballapp/Ui/Widgets/customTextFormField.dart';
import 'package:footballapp/utils/colors_file.dart';
import 'package:footballapp/utils/image_file.dart';
import 'package:footballapp/utils/navigator.dart';
import 'package:footballapp/utils/size_config.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../../utils/navigator.dart';
import '../../utils/navigator.dart';


class Login extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  Auth auth = Auth();
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
        return Material(
      child: Scaffold(
        backgroundColor: Color(0xfff283149),
        body: ModalProgressHUD(
          inAsyncCall:  Provider.of<modelHud>(context).isloading,
          child: Form(
            key: _globalKey,
            child: Stack(
              children: <Widget>[
//                SvgPicture.asset(
//                  backgoungimage,
//                  fit: BoxFit.cover,
//                  width: width,
//                  height: height,
//                  color: Colors.white,
//                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: height,
                  width: width,
                  child: ListView(
                    children: <Widget>[
//                      Padding(
//                        padding: const EdgeInsets.symmetric(
//                            horizontal: 50, vertical: 5),
//                        child: Container(
//                          width: width * 0.2,
//                          child: SvgPicture.asset("images/icon.svg"),
//                        ),
//                      ),
                      //text
                      Center(
                          child: Text(
                        "الحريف",
                        style: TextStyle(
                            fontFamily: 'custom_font',
                            color: Colors.white,
                            fontSize: 27),
                      )),
                      //text
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Container(
                              child: Text("اظهر مهاراتك الان..",
                                  style: TextStyle(
                                      fontFamily: 'custom_font',
                                      color: Colors.white,
                                      fontSize: 22))),
                        ),
                      ),
                      //text

                      //custom text field for username
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 7),
                        child: customTextFormField(
                          hint: "الايميل",
                          iconData: Icons.email,
                          onclick: (value) {
                            _email = value;
                          },
                        ),
                      ),
                      //custom text for password
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 7),
                        child: customTextFormField(
                            hint: "كلمه السر",
                            iconData: Icons.vpn_key,
                            onclick: (value) {
                              _password = value;
                            }),
                      ),
                      //login button
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Builder(
                          builder: (context) => FlatButton(
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () async {

                            final modelhud = Provider.of<modelHud>(context,listen: false);
                            if (_globalKey.currentState.validate()) {
                              _globalKey.currentState.save();
                              modelhud.isprogressloding(true);
                              try {
                                final authResult = await auth
                                    .sign_in_with_email_and_password(
                                    _email.trim(), _password.trim());

                                modelhud.isprogressloding(false);
                                //Navigator.pushNamed(context, waitngWidget.id);
                                navigateAndClearStack(context, HomePage());
                                print(authResult.user.uid);
                              } on PlatformException catch (e) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                    e.message.toString(),

                                    style: TextStyle(fontFamily: 'font'),
                                  ),
                                ));
                                modelhud.isprogressloding(false);
                              }
                            }
                            },
                            color: primaryAppColor,
                            child: Text("دخول",
                                style: TextStyle(fontFamily: 'custom_font')),
                          ),
                        ),
                      ),
                      Center(
                        child: Text("أو سجل بواسطه",
                            style: TextStyle(fontFamily: 'custom_font',color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                ///facebook auth fun
                                auth.facebooksiginin(context);
                              },
                              child: Container(
                                  width: width * 0.4,
                                  height: height * 0.07,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xfff4167B2),
                                  ),
                                  child: Center(
                                      child: Text("Facebook",
                                          style: TextStyle(
                                              fontFamily: 'custom_font')))),
                            ),
                            Builder(
                              builder: (context) => GestureDetector(
                                onTap:() async {
                                  ///Google auth fun
                                  auth.googlesignin(context);
                                },
                                child: Container(
                                    width: width * 0.4,
                                    height: height * 0.07,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xfffF14436),
                                    ),
                                    child: Center(
                                        child: Text("Gmail",
                                            style: TextStyle(
                                                fontFamily: 'custom_font')))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                          child: Text("ليس لديك أكونت؟",
                              style: TextStyle(fontFamily: 'custom_font',color: Colors.white))),
                      GestureDetector(
                        onTap: () {
                         navigateAndClearStack(context, Register());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Center(
                              child: Text(
                            "سجل الان",
                            style: TextStyle(
                                fontFamily: 'custom_font',
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                color: Colors.white),
                          )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
