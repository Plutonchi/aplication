import 'package:aplication/app/data/service/firebase_auth/firebase_options.dart';
import 'package:aplication/app/modules/welcom/views/welcome_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
         
         );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      // initialRoute: AppPages.INITIAL,
      // getPages: AppPages.routes,
      home: WelcomeView(),
    ),
  );
}
