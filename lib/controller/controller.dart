import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:practice_app/screens/home.dart';
import 'package:practice_app/screens/sign_up.dart';

class MainController extends GetxController {
  @override
  void onReady() {
    log("main controller chal gya");
    Future.delayed(const Duration(milliseconds: 2000), () {
      auth.userChanges().listen((user) {
        if (user == null) {
          log("log out hai  signup kro");
          Get.to(() => SignupScreen());
        } else {
          log("log in hai home screen pe jao");
          Get.to(() => HomePage());
        }
      });
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void login(String email, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void signup(String email, String password) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await auth.signOut();
  }
}

FirebaseAuth auth = FirebaseAuth.instance;
