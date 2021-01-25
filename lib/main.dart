import 'package:flutter/material.dart';
import 'Provider/modelHud.dart';
import 'file:///C:/Users/Elshafey/AndroidStudioProjects/footballapp/lib/Ui/Screens/SplahScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
MultiProvider(providers: [
  ChangeNotifierProvider<modelHud>(
    create: (context) => modelHud(),
  ),
],
    child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  )));
}

