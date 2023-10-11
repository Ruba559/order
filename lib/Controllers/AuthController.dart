import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:order/Constants/routes.dart';

class AuthController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  login() async {
    print(email.text);
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Get.toNamed(AppRoute.home);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text, password: password.text);
        Get.toNamed(AppRoute.home);
      }
    } catch (e) {
      print(e);
    }

    email.text = '';
    password.text = '';
  }

signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if(googleUser != null)
    {
       final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
  FirebaseAuth.instance.signInWithCredential(credential);

    Get.toNamed(AppRoute.home);
    }
   
  }
}
