import 'package:bionic_teknologi_indonesia/common/custom_text.dart';
import 'package:bionic_teknologi_indonesia/core/style/color_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static const String loginRoute = "login-route";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? name;

  String? email;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            IconButton(
                onPressed: () async {
                  UserCredential result = await signInWithGoogle();
                  setState(() {
                    name = result.user?.displayName;
                    email = result.user?.email;
                  });
                },
                icon: Icon(
                  Icons.login,
                  color: Colors.red,
                )),
            CustomText(
                text: name ?? "",
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorApp.black600),
            CustomText(
                text: email ?? "",
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorApp.black600),
               
           
                
          ],
        ),
      ),
    );
  }
}
