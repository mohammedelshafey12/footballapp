import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FacebookLogin facebookLogin = FacebookLogin();
  final _auth = FirebaseAuth.instance;
  Future<AuthResult> sign_up_with_email_and_password(
      String Email, String Password) async {
    final authresult = await _auth.createUserWithEmailAndPassword(
        email: Email, password: Password);
    return authresult;
  }


  Future<AuthResult> sign_in_with_email_and_password(
      String Email, String Password) async {
    final authresult =
    await _auth.signInWithEmailAndPassword(email: Email, password: Password);
    return authresult;
  }
  final GoogleSignIn googleSignIn = GoogleSignIn();
   googlesignin(context,home)async{

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
