import 'package:app_flutt/pages/Log%20outpage.dart';
import 'package:app_flutt/pages/intropage.dart';
import 'package:app_flutt/pages/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:app_flutt/pages/homepage.dart';

class Authcontroller extends GetxController {
  //Authentication Instances
  static Authcontroller instances = Get.find();
  //email,password,name..
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);

    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("Login page");
      Get.offAll(() => const loginPage());
    } else {
      Get.offAll(() => const Intropage());

      Get.offAll(() => const homepage());
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.grey,
          snackPosition: SnackPosition.TOP,
          titleText: Text("Account creation is failed",
              style: TextStyle(color: Colors.black)),
          messageText:
              Text(e.toString(), style: const TextStyle(color: Colors.black)));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About login", "login message",
          backgroundColor: Colors.grey,
          snackPosition: SnackPosition.BOTTOM,
          titleText:
              Text("Login failed", style: TextStyle(color: Colors.black)),
          messageText: Text("checkout the Mail Id & Password",
              style: TextStyle(color: Colors.black)));
    }
  }

  void logout() async {
    await auth.signOut();
  }

  //Determine if the user is authenticated.
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const Intropage();
          } else {
            return const loginPage();
          }
        });
  }
}
