import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footballapp/utils/colors_file.dart';
class customTextFormField extends StatelessWidget {
  String hint;
  IconData iconData;

  Function onclick;
  customTextFormField({
    @required this.hint ,@required this.iconData,
     this.onclick,
    Key key,
  }) : super(key: key);
  String errorMassage(String str){
    switch(hint){
      case "User Name" :return "User Name Is Empty";
      case "Email" :return "Email Is Empty";
      case "Password" :return "Password Is Empty";
      case "Age" :return "Age Is Empty";
      default : return "يجب ملئ البيانات كامله";
    }
  }


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      validator: (value){
        if (value.isEmpty){
          return errorMassage(hint);
        }

      },
      keyboardType: hint =="Age"?TextInputType.number:hint =="Email"?TextInputType.emailAddress:TextInputType.text,
      onSaved: onclick,
      obscureText: hint=="كلمه السر"?true:false,
      cursorColor: primaryAppColor,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
              ,borderSide: BorderSide(color: primaryAppColor)
          ),
          focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
              ,borderSide: BorderSide(color: primaryAppColor)
          ) ,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
              ,borderSide: BorderSide(color: primaryAppColor)
          ) ,
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(iconData,color: primaryAppColor),
          hintText: hint,
          hintStyle: TextStyle(fontFamily: 'font')
      ),
    );
  }
}