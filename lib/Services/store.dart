import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footballapp/models/post.dart';
import 'package:footballapp/models/user.dart';
import 'package:footballapp/utils/constants.dart';
class Store {
  /// Take Instance From FireStore
  Firestore firestore = Firestore.instance;
  /// Add new User With Email And Password To FireStore DataBase
  adduser(User user) {
    firestore.collection(constants.usercollection).document(user.uid).setData({
      constants.username: user.username,
      constants.age: user.userAge,
      constants.uid: user.uid,
      constants.phone :user.userPhoneNumber,
      constants.possition:user.userPossition
    });
  }
  /// Add Facebook User To FireStore DataBase
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
  /// Add Google User To FireStore DataBase
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

  /// Add post To firebase...
  addPost(Post post){
    firestore.collection(constants.posts).document().setData({
      constants.postContent: post.postContent,
      constants.time: post.postDate,
      constants.uid: post.postUserUid,
      constants.likesCount :post.likesCount,
      constants.username :post.username
    });
  }
  /// Get Posts From Firebase
  Stream<QuerySnapshot> getposts(){
    return firestore.collection(constants.posts).orderBy(constants.time,descending: true).snapshots();
  }
  /// Get User Info
  Stream<QuerySnapshot> UserInfo(BuildContext context,String uid) {
    return firestore
        .collection(constants.usercollection)
        .where(constants.uid, isEqualTo: uid)
        .snapshots();
  }
  /// update like_count Increment
  updateLikeCount(String pid){
    firestore.collection(constants.posts).document(pid).setData({
      constants.likesCount:FieldValue.increment(1)
    },merge: true);
  }
  /// update like_count to Decrement
  updateLikeCountDecrement(String pid){
    firestore.collection(constants.posts).document(pid).setData({
      constants.likesCount:FieldValue.increment(-1)
    },merge: true);
  }
}