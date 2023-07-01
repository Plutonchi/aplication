// import 'package:aplication/app/data/service/firebase_auth/firebase_options.dart';
// import 'package:aplication/app/modules/auth/views/admin_auth_view/auth_view.dart';
import 'package:aplication/app/modules/welcom/views/welcome_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: 'AIzaSyAe2Du1MdYls4HIrzifkZbGnzrhVTIliMs',
    appId: '1:108186975857:web:c27ca939cdffa76707a5d0',
    messagingSenderId: '108186975857',
    projectId: 'chat-28508',
    authDomain: 'chat-28508.firebaseapp.com',
    storageBucket: 'chat-28508.appspot.com',
    measurementId: 'G-W2MRT064QJ',
  ),
  ).then((value) => WelcomeView());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      home: WelcomeView(),
    ),
  );
}
