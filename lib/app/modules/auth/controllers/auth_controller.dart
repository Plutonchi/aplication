// ignore_for_file: avoid_print, unused_field

import 'package:aplication/app/modules/auth/views/teachers_auth_views/signIn_view.dart';
import 'package:aplication/app/modules/home/views/home_view.dart';
import 'package:aplication/app/modules/home/widgets/custom_snack_bar.dart';
import 'package:aplication/app/modules/welcom/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isVisible = true.obs;
  Rx<String> password = ''.obs;
  Rx<String> eMail = ''.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  var emailConroller = TextEditingController();
  var namelConroller = TextEditingController();
  var passwordConroller = TextEditingController();

  // @override
  // void onReady() {
  //   super.onReady();
  //   _user = Rx<User?>(auth.currentUser);
  //   _user.bindStream(auth.userChanges());
  //   ever(_user, _intialScreen);
  // }

  RxBool processing = false.obs;

  RxString name = ''.obs;

  void register(email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.to(HomeView()));
      customSnackBar('Success', '', '');
    } catch (e) {
      Get.snackbar(
        'About Register',
        "",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        titleText: const Text("Registration failed",
            style: TextStyle(color: Colors.white)),
      );
      print(e);
    }
  }

  void login(String email, password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.to(HomeView()));
      ;
      customSnackBar('Success', '', '');
    } catch (e) {
      Get.snackbar(
        'About Login',
        "",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        titleText:
            const Text("Login failed", style: TextStyle(color: Colors.white)),
      );
      print(e);
    }
  }

  void logOut() async {
    await auth.signOut();
  }

  // _intialScreen(User? user) {
  //   if (user == null) {
  //     print("LoginPage");
  //     Get.offAll(
  //       SignInView(),
  //     );
  //   } else {
  //     Get.offAll(
  //       HomeView(),
  //     );
  //   }
  // }
}

extension EmailValidato on String {
  bool isValidEmail() {
    return RegExp(r'^([a-zA-Z0-9]+)([@])([a-zA-Z0-9]+)([\-\_\.])([a-z]{2,3})$')
        .hasMatch(this);
  }
}
