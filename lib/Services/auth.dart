
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:footballapp/Ui/Screens/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../utils/navigator.dart';

class Auth {

  final GoogleSignIn googleSignIn = GoogleSignIn();
final FacebookLogin facebookLogin = FacebookLogin();
  final _auth = FirebaseAuth.instance;
  ///create account with firebase auth Email and Password
  Future<AuthResult> sign_up_with_email_and_password(
      String Email, String Password) async {
    final authresult = await _auth.createUserWithEmailAndPassword(
        email: Email, password: Password);
    return authresult;
  }

 ///sign in with firebase auth Email and password
  Future<AuthResult> sign_in_with_email_and_password(
      String Email, String Password) async {
    final authresult =
    await _auth.signInWithEmailAndPassword(email: Email, password: Password);
    return authresult;
  }

  facebooksiginin(context) async {
    //                              Store store = Store();
    // UserProvider userprovider = Provider.of<UserProvider>(context,listen: false);
    FacebookLoginResult facebookLoginResult = await facebookLogin.logIn();

    final FacebookAccessToken accessToken = facebookLoginResult.accessToken;

    AuthCredential authCredential = FacebookAuthProvider.getCredential(accessToken: accessToken.token);

    FirebaseUser user;
    try{
      user = (await _auth.signInWithCredential(authCredential)).user;
    //  userprovider.getaccesstoken(accessToken.token);

//                                final DocumentSnapshot doc =
//                                await Firestore.instance.collection(constants.usercollection).document(user.uid).get();
//                                if(!doc.exists) {
//                                  store.adduserfacebook(User(
//                                      user.displayName, null, user.uid),
//                                      user.uid);
//                                }

    navigateAndClearStack(context, HomePage());
    }catch(e){
    print(e.toString());
    }finally{
    if(user != null){
    print(user.displayName);
    print("https://graph.facebook.com/v2.12/me?fields=picture.height(200)&access_token=${facebookLoginResult.accessToken.token}");
    print(user.phoneNumber);
    print(user.email);


    // ignore: missing_return
    }
    }
  }

  /// Google sign in with firebase and save user details in firebase
   googlesignin(context)async{
     final GoogleSignIn googleSignIn = GoogleSignIn();
     final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
     final GoogleSignInAuthentication googleSignInAuthentication =
     await googleSignInAccount.authentication;

     final AuthCredential credential = GoogleAuthProvider.getCredential(
       accessToken: googleSignInAuthentication.accessToken,
       idToken: googleSignInAuthentication.idToken,
     );

     final AuthResult authResult = await _auth.signInWithCredential(credential);
     final FirebaseUser user = authResult.user;
     assert(!user.isAnonymous);
     assert(await user.getIdToken() != null);

     final FirebaseUser currentUser = await _auth.currentUser();
     if(currentUser !=null){
       //Store store = Store();
//      final DocumentSnapshot doc =
//      await Firestore.instance.collection(constants.usercollection).document(user.uid).get();
//      if(!doc.exists) {
//        store.adduserfacebook(User(
//            user.displayName, null, user.uid),
//            user.uid);
       print("not null");
     }
     navigateAndClearStack(context, HomePage());
    }
  Future signout() async{
    try{
      return await _auth.signOut();
    }catch (e){
      print(e.toString());
    }
  }
  void signOutGoogle() async{
    await googleSignIn.signOut();

    print("User Sign Out");
  }

}
