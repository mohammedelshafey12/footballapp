import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footballapp/Ui/Screens/login.dart';
import 'package:footballapp/Ui/Screens/home_page.dart';
import 'package:provider/provider.dart';
class waitngWidget extends StatefulWidget {

  @override
  _waitngWidgetState createState() => _waitngWidgetState();
}

class _waitngWidgetState extends State<waitngWidget> {
  @override
  Widget build(BuildContext context) {
     return MultiProvider(
       providers: [
         StreamProvider<FirebaseUser>.value(value: FirebaseAuth.instance.onAuthStateChanged),
       ],
       child: Builder(
         builder: (context)=>
          Material(
         child: Provider.of<FirebaseUser>(context)==null? Login():HomePage(),
     ),
       ),
     );
  }
}
