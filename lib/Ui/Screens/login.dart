import 'package:flutter/material.dart';
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Text("ابلكيشن الحريف يرحب بكم",style: TextStyle(fontFamily: 'custom_font'),),
          ),
        ),
      ),
    );
  }
}
