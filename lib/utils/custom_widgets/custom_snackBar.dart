import 'package:flutter/material.dart';
import 'package:footballapp/utils/colors_file.dart';

void CustomSnackBar(BuildContext context,String content){
  Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        duration: Duration(seconds: 3),
        elevation: 6.0,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            Icon(Icons.insert_emoticon,
                color: primaryAppColor),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child:  Text(
                "${content.toString()}",
                style: TextStyle(
                    color: primaryAppColor),
              ) ,
            ),
          ],
        ),
      )
  );
}