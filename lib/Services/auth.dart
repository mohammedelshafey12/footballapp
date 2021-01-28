
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:footballapp/Ui/Screens/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../Provider/modelHud.dart';
import '../Ui/Widgets/customTextFormField.dart';
import '../utils/navigator.dart';

import 'package:footballapp/utils/constants.dart';
import 'store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Auth {
  int _age,_phone;
  String _possition;
  final store = Store();
  final GoogleSignIn googleSignIn = GoogleSignIn();
final FacebookLogin facebookLogin = FacebookLogin();
  final _auth = FirebaseAuth.instance;
  ///create account with firebase auth Email and Password
  Future<AuthResult> sign_up_with_email_and_password(
      String Email, String Password) async {
    final authresult = await _auth.createUserWithEmailAndPassword(
        email: Email, password: Password);
    return authresult;
  }

 ///sign in with firebase auth Email and password
  Future<AuthResult> sign_in_with_email_and_password(
      String Email, String Password) async {
    final authresult =
    await _auth.signInWithEmailAndPassword(email: Email, password: Password);
    return authresult;
  }

  facebooksiginin(context) async {
    //                              Store store = Store();
    // UserProvider userprovider = Provider.of<UserProvider>(context,listen: false);
    FacebookLoginResult facebookLoginResult = await facebookLogin.logIn();

    final FacebookAccessToken accessToken = facebookLoginResult.accessToken;

    AuthCredential authCredential = FacebookAuthProvider.getCredential(accessToken: accessToken.token);

    FirebaseUser user;
    try{
      user = (await _auth.signInWithCredential(authCredential)).user;
      final DocumentSnapshot doc =  await Firestore.instance.collection(constants.usercollection).document(user.uid).get();
      if(!doc.exists) {
        final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
        double height = MediaQuery
            .of(context)
            .size
            .height;
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) =>
              Scaffold(
                body: Container(
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.15,),
                        Text("ااملأ البيانات التاليه${user.displayName} مرحب",
                          style: TextStyle(fontFamily: 'custom_font'),),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 7),
                          child: customTextFormField(hint: "عمرك",
                              iconData: Icons.sentiment_neutral,
                              onclick: (value) {
                                _age = int.parse(value);
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 7),
                          child: customTextFormField(hint: "مركزك في الملعب",
                              iconData: Icons.sports_esports,
                              onclick: (value) {
                                _possition = value;
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 7),
                          child: customTextFormField(hint: "رقم هاتفك",
                              iconData: Icons.phone,
                              onclick: (value) {
                                _phone = int.parse(value);
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Builder(
                            builder: (context) =>
                                FlatButton(
                                  padding: EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),),
                                  onPressed: () async {
                                    final modelhud = Provider.of<modelHud>(
                                        context, listen: false);
                                    if (_globalKey.currentState.validate()) {
                                      _globalKey.currentState.save();
                                      modelhud.isprogressloding(true);
                                      try {
                                        String url = "https://graph.facebook.com/v2.12/me?fields=picture.height(200)&access_token=${facebookLoginResult
                                            .accessToken.token}";
                                        store.addFacebookUser(
                                            user, _age, _possition, url);
                                        navigateAndClearStack(
                                            context, HomePage());
                                        modelhud.isprogressloding(false);
                                      } catch (e) {
                                        print(e.toString());
                                      }
                                    }
                                    modelhud.isprogressloding(false);
                                  },
                                  color: Colors.blue,

                                  child: Text("تسجيل", style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "custom_font"),),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        );
      }else{
        navigateAndClearStack(context, HomePage());
      }

   /// navigateAndClearStack(context, HomePage());
    }catch(e){
    print(e.toString());


    // ignore: missing_return

    }
  }

  /// Google sign in with firebase and save user details in firebase
   googlesignin(context)async{
     final GoogleSignIn googleSignIn = GoogleSignIn();
     final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
     final GoogleSignInAuthentication googleSignInAuthentication =
     await googleSignInAccount.authentication;

     final AuthCredential credential = GoogleAuthProvider.getCredential(
       accessToken: googleSignInAuthentication.accessToken,
       idToken: googleSignInAuthentication.idToken,
     );

     final AuthResult authResult = await _auth.signInWithCredential(credential);
     final FirebaseUser user = authResult.user;
     assert(!user.isAnonymous);
     assert(await user.getIdToken() != null);

     final FirebaseUser currentUser = await _auth.currentUser();
     if(currentUser !=null){
       //Store store = Store();
//      final DocumentSnapshot doc =
//      await Firestore.instance.collection(constants.usercollection).document(user.uid).get();
//      if(!doc.exists) {
//        store.adduserfacebook(User(
//            user.displayName, null, user.uid),
//            user.uid);
       print("not null");
     }
     final DocumentSnapshot doc =  await Firestore.instance.collection(constants.usercollection).document(user.uid).get();
     if(!doc.exists) {
       final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
       double height = MediaQuery
           .of(context)
           .size
           .height;
       showMaterialModalBottomSheet(
         context: context,
         builder: (context) =>
             Scaffold(
               body: Container(
                 child: Form(
                   key: _globalKey,
                   child: Column(
                     children: [
                       SizedBox(height: height * 0.15,),
                       Text("ااملأ البيانات التاليه${user.displayName} مرحب",
                         style: TextStyle(fontFamily: 'custom_font'),),
                       Padding(
                         padding: const EdgeInsets.symmetric(
                             horizontal: 20, vertical: 7),
                         child: customTextFormField(hint: "عمرك",
                             iconData: Icons.sentiment_neutral,
                             onclick: (value) {
                               _age = int.parse(value);
                             }),
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(
                             horizontal: 20, vertical: 7),
                         child: customTextFormField(hint: "مركزك في الملعب",
                             iconData: Icons.sports_esports,
                             onclick: (value) {
                               _possition = value;
                             }),
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(
                             horizontal: 20, vertical: 7),
                         child: customTextFormField(hint: "رقم هاتفك",
                             iconData: Icons.phone,
                             onclick: (value) {
                               _phone = int.parse(value);
                             }),
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(
                             horizontal: 20, vertical: 15),
                         child: Builder(
                           builder: (context) =>
                               FlatButton(
                                 padding: EdgeInsets.all(15),
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10),),
                                 onPressed: () async {
                                   final modelhud = Provider.of<modelHud>(
                                       context, listen: false);
                                   if (_globalKey.currentState.validate()) {
                                     _globalKey.currentState.save();
                                     modelhud.isprogressloding(true);
                                     try {

                                       store.addGoogleUser(
                                           user, _age, _possition);
                                       navigateAndClearStack(
                                           context, HomePage());
                                       modelhud.isprogressloding(false);
                                     } catch (e) {
                                       print(e.toString());
                                     }
                                   }
                                   modelhud.isprogressloding(false);
                                 },
                                 color: Colors.blue,

                                 child: Text("تسجيل", style: TextStyle(
                                     color: Colors.black,
                                     fontFamily: "custom_font"),),
                               ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             ),
       );
     }else{
       navigateAndClearStack(context, HomePage());
     }

   }
  Future signout() async{
    try{
      return await _auth.signOut();
    }catch (e){
      print(e.toString());
    }
  }
  void signOutGoogle() async{
    await googleSignIn.signOut();

    print("User Sign Out");
  }

}
