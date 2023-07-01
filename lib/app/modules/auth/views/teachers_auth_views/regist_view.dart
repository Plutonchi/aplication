import 'dart:developer';

import 'package:aplication/app/constans/app_colors.dart';
import 'package:aplication/app/constans/app_text.dart';
import 'package:aplication/app/constans/app_text_styles.dart';
import 'package:aplication/app/modules/auth/controllers/auth_controller.dart';
import 'package:aplication/app/modules/auth/views/teachers_auth_views/signIn_view.dart';
import 'package:aplication/app/modules/auth/widgets/snack_bar_widget.dart';
import 'package:aplication/app/modules/home/controllers/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


// ignore: must_be_immutable
class RegistView extends StatefulWidget {
  RegistView({Key? key}) : super(key: key);

  @override
  State<RegistView> createState() => _RegistViewState();
}

class _RegistViewState extends State<RegistView> {
  final _controller = Get.put(AuthController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');

  final _homeController = Get.put(HomeController());


  String? _name;

  String? _email;

  String? _password;

  bool isVisible = true;

  bool processing = false;

  

  late String _uid;

   void signUp() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email!,
            password: _password!,
          );
    
         
          _uid = FirebaseAuth.instance.currentUser!.uid;
          
                              _homeController.navigateToHomeView(context);
         ;
          await customers.doc(_uid).set({
            'name': _name,
            'email': _email,
            'phone': '',
            'address': '',
           
          });
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            setState(() {
              processing = false;
            });
            SnackBarWidget.snackBar(
                'The password provided is too weak.', _scaffoldKey);
            log('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            setState(() {
              processing = false;
            });
            SnackBarWidget.snackBar(
                'The account already exists for that email.', _scaffoldKey);
            log('The account already exists for that email.');
          }
        } catch (e) {
          setState(() {
            processing = false;
          });
          SnackBarWidget.snackBar('$e', _scaffoldKey);
          log('$e');
        }
      
        SnackBarWidget.snackBar('Please pick an image', _scaffoldKey);
      }
     else {
      setState(() {
        processing = false;
      });
      SnackBarWidget.snackBar('Please fill your blank', _scaffoldKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Form(
          key:_controller.formKey,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                
                   Column(
                    children: [
                      Center(
                        child: Image.asset(
                          "images/1.png",
                          width: 1000,
                          height: 300,
                        ),
                      ),
                      const Center(
                          child: Text("Registration",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Gentium"))),
                      const SizedBox(
                        height: 90,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 10, right: 10),
                        child: TextFormField(
                           validator: (value){  if (value!.isEmpty) {
                                return 'please fill your name';
                              } else if (value.isValidEmail() == false) {
                                return 'Not Valid';
                              } else if (value.isValidEmail() == true) {
                                return null;
                              }
                              return null;},
                          onChanged: (value) {
                            _controller.name.value;
                          },
                          controller:_controller.namelConroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13)),
                            labelText: 'Name',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value){  if (value!.isEmpty) {
                                return 'please fill your email';
                              } else if (value.isValidEmail() == false) {
                                return 'Not Valid';
                              } else if (value.isValidEmail() == true) {
                                return null;
                              }
                              return null;},
                          onChanged: (value) {
                            _controller.eMail.value;
                          },
                          
                          controller:_controller.emailConroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13)),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                           validator: (value){  if (value!.isEmpty) {
                                return 'please fill your password';
                              } else if (value.isValidEmail() == false) {
                                return 'Not Valid';
                              } else if (value.isValidEmail() == true) {
                                return null;
                              }
                              return null;},
                          onChanged: (value) {
                            _controller.password.value;
                          },
                          controller:_controller.passwordConroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13)),
                            labelText: AppText.password,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 100, top: 10),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(AppText.haveAcc,
                                  style: AppTextStyle.w600Gen16),
                              TextButton(
                                onPressed: () {
                                  Get.to(
                                    SignInView(),
                                  );
                                },
                                child: Text(AppText.signIn,
                                    style: AppTextStyle.w500Gen17),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                         signUp();
                         log("LOG =====> ${signUp}");
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.97,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.black53,
                          ),
                          child: const Center(
                            child: Text(AppText.creat,
                                style: AppTextStyle.whiteBlod20),
                          ),
                        ),
                      ),
                    ],
                  ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
