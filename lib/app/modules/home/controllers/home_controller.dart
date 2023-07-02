import 'package:aplication/app/modules/auth/views/admin_auth_view/auth_view.dart';
import 'package:aplication/app/modules/categories/views/english_category_view.dart';
import 'package:aplication/app/modules/categories/views/it_category_view.dart';
import 'package:aplication/app/modules/categories/views/matematics_category_view.dart';
import 'package:aplication/app/modules/categories/views/ort_category_view.dart';
import 'package:aplication/app/modules/categories/views/russian_category_view.dart';
import 'package:aplication/app/modules/home/views/home_view.dart';
import 'package:aplication/app/modules/receipt/views/receipt_view.dart';
import 'package:aplication/app/modules/welcom/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void navigateToEnglishCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EnglishCategory()),
    );
  }

  void navigateToITCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItCategory()),
    );
  }

  void navigateToORTCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrtCategory()),
    );
  }

  void navigateToMatematicsCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MatematicsCategory()),
    );
  }

  void navigateToRussianCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RussianCategory()),
    );
  }

  void navigateToReceiptView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  const ReceiptView()),
    );
  }

  void navigateToHomeView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeView()),
    );
  }

  void navigateToAuthView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthView()),
    );
  }
    void navigateToWelcomeView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomeView()),
    );
  }
}
