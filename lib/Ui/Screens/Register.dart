import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footballapp/Ui/Screens/waitingWidget.dart';
import 'package:footballapp/models/user.dart';
import 'package:footballapp/utils/navigator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../../Provider/modelHud.dart';
import '../../Services/auth.dart';
import '../../Services/store.dart';
import '../Widgets/customTextFormField.dart';
 
class Register extends StatelessWidget {
  static String id  = 'signup';
  String _name,_email,_password,_possition;
  final _auth = Auth();
  int _age,_phone;
  final store  = Store();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Material(
      child: Scaffold(
        backgroundColor: Color(0xfff283149),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<modelHud>(context).isloading,
          child: Form(
            key: _globalKey,
            child: Stack(
              children: <Widget>[
//                SvgPicture.asset(
//                  constants.backgoungimage,
//                  fit: BoxFit.cover,
//                  width: width,
//                  height: height,
//                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    height: height,
                    width: width,
                    child: ListView(
                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.symmetric(
//                              horizontal: 50, vertical: 5),
//                          child: Container(
//                            width: width*0.2,
//                            child: SvgPicture.asset(constants.icon),
//                          ),
//                        ),
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
                        //text
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          child: Center(
                              child: FittedBox(
                                child:Text("سجل بياناتك الان",
                                    style: TextStyle(
                                        fontFamily: 'custom_font',
                                        color: Colors.white,
                                        fontSize: 22)),
                          ),
                              )

                          ),

                        //custom text field for username
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                          child: customTextFormField(hint: "اسمك",iconData: Icons.account_circle,onclick: (value){
                            _name = value;
                          },),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                          child: customTextFormField(hint: "الأيميل",iconData: Icons.email,onclick: (value){
                            _email = value;
                          }),
                        ),
                        //custom text for password
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                          child: customTextFormField(hint: "كلمه السر",iconData: Icons.vpn_key,onclick: (value){
                            _password = value;
                          }),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                          child: customTextFormField(hint: "عمرك",iconData: Icons.sentiment_neutral,onclick: (value){
                            _age = int.parse(value);
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                          child: customTextFormField(hint: "مركزك في الملعب",iconData: Icons.sports_esports,onclick: (value){
                            _possition = value;
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                          child: customTextFormField(hint: "رقم هاتفك",iconData: Icons.phone,onclick: (value){
                            _phone = int.parse(value);
                          }),
                        ),
                        //login button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                          child: Builder(
                            builder: (context)=> FlatButton(
                              padding: EdgeInsets.all(15),
                              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                              onPressed: () async {
                                final modelhud= Provider.of<modelHud>(context,listen: false);
                                if(_globalKey.currentState.validate()) {
                                  _globalKey.currentState.save();
                                  modelhud.isprogressloding(true);
                                  try {
                                    final authResult = await _auth
                                        .sign_up_with_email_and_password(
                                        _email, _password);
                                    modelhud.isprogressloding(false);
                                  store.adduser(User(_name,authResult.user.uid,_phone,_possition,_age));
                                   // Navigator.pushNamed(context, waitngWidget.id);
                                    navigateAndClearStack(context, waitngWidget());
                                    print(authResult.user.uid);
                                  }on PlatformException catch(e){
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                        e.message.toString(),
                                        style: TextStyle(fontFamily: 'font'),
                                      ),
                                    ));
                                    modelhud.isprogressloding(false);
                                  }
                                }
                                modelhud.isprogressloding(false);
                              },
                              color: Colors.blue,

                              child: Text( "تسجيل",style: TextStyle(color: Colors.black,fontFamily: "custom_font"),),
                            ),
                          ),
                        ),

                      ],

                    ),
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
