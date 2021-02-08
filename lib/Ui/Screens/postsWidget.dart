import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:footballapp/Services/store.dart';
import 'package:footballapp/utils/colors_file.dart';
import 'package:footballapp/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';

class PostsWidget extends StatefulWidget {
  @override
  _PostsWidgetState createState() => _PostsWidgetState();
  ScrollController _mycontroller ;
  PostsWidget(this._mycontroller);
}



class _PostsWidgetState extends State<PostsWidget> {
  Timestamp timestamp;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
  getUser()async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      user1 = user;
    });
  }
  FirebaseUser user1;
  Store store = Store();
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
        stream: store.getposts(),
        builder: (context,snapshot){
//          var doc =snapshot.data.documents;

          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          else
              return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  // controller: widget._mycontroller,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context,index){
                    timestamp = snapshot.data.documents[index][constants.time];
                    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(timestamp.toDate());
                    return Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20,bottom: 10,top: 10),
                      child: Container(
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
                                snapshot.data.documents[index][constants.username]==null?"UserName":snapshot.data.documents[index][constants.username],
                                style: TextStyle(color: whiteColor,fontFamily: "custom_font"),

                              ),
                              subtitle: Row(
                                children: [

                                  Text(formattedDate==null?"":formattedDate,
                                      style: TextStyle(color: grey)),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${snapshot.data.documents[index][constants.postContent]}",
                                    style: TextStyle(color: whiteColor),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                  Container(

                                    width:
                                    MediaQuery.of(context).size.width *0.5,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            LikeButton(
//                                                 onTap:(islike) async{
//
//                                                 },
                                              likeBuilder: (bool isLiked) {
                                                if (!isLiked) {
                                                  islike(snapshot, index);
                                                 // return null;
                                                }else
                                                  return null;
                                              },
                                              likeCount: 665,
                                              countBuilder: (int count, bool isLiked, String text) {
                                                var color = isLiked ? Colors.red : Colors.grey;
                                                Widget result;
                                                if (count == 0) {
                                                  result = Text(
                                                    "love",
                                                    style: TextStyle(color: color),
                                                  );
                                                } else
                                                  result = Text(
                                                    text,
                                                    style: TextStyle(color: color),
                                                  );
                                                return result;
                                              },
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Like",
                                              style:
                                              TextStyle(color: whiteColor),
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
                                              style:
                                              TextStyle(color: whiteColor),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });



        }

    );
  }
  Future<bool> onLikeButtonTapped(bool isLiked,String) async{
    /// send your request here
    // final bool success= await sendRequest();
     store.updateLikeCount(user.uid);
    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }
  islike( snapshot,index) async {
    await   store.updateLikeCount(snapshot.data
        .documents[index]
        .documentID
        .toString());

  }
}
