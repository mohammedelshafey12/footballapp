import 'package:flutter/material.dart';
import 'package:footballapp/Provider/modelHud.dart';
import 'package:footballapp/Ui/Screens/SplahScreen.dart';
import 'package:footballapp/Ui/Screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<modelHud>(
          create: (context) => modelHud(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        // home: HomePage(),
      )));
}


