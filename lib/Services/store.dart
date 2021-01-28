import 'package:cloud_firestore/cloud_firestore.dart';
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
}