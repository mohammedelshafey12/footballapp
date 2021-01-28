import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:footballapp/models/user.dart';
import 'package:footballapp/utils/constants.dart';
class Store {
  Firestore firestore = Firestore.instance;
  adduser(User user) {
    firestore.collection(constants.usercollection).document(user.uid).setData({
      constants.username: user.username,
      constants.age: user.userAge,
      constants.uid: user.uid,
      constants.phone :user.userPhoneNumber,
      constants.possition:user.userPossition
    });
  }
  addFacebookUser(FirebaseUser user,int age,String possition,String url)async{
    final DocumentSnapshot doc =
        await Firestore.instance.collection(constants.usercollection).document(user.uid).get();
    if(!doc.exists) {
      firestore.collection(constants.usercollection).document(user.uid).setData({
        constants.username: user.displayName,
        constants.age: age,
        constants.uid: user.uid,
        constants.userphoto :url,
        constants.possition:possition
      });
    }
  }
  addGoogleUser(FirebaseUser user,int age,String possition)async{
    final DocumentSnapshot doc =
    await Firestore.instance.collection(constants.usercollection).document(user.uid).get();
    if(!doc.exists) {
      firestore.collection(constants.usercollection).document(user.uid).setData({
        constants.username: user.displayName,
        constants.age: age,
        constants.uid: user.uid,
        constants.possition:possition
      });
    }
  }
}