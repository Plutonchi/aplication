// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:developer';

import 'package:aplication/app/constans/app_colors.dart';
import 'package:aplication/app/constans/app_text.dart';
import 'package:aplication/app/constans/app_text_styles.dart';
import 'package:aplication/app/modules/auth/controllers/auth_controller.dart';
import 'package:aplication/app/modules/auth/views/teachers_auth_views/regist_view.dart';
import 'package:aplication/app/modules/auth/widgets/snack_bar_widget.dart';
import 'package:aplication/app/modules/welcom/views/welcome_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  var emailConroller = TextEditingController();
  final _controller = Get.put(AuthController());
  var passwordConroller = TextEditingController();
  String? _email;
  String? _password;
  bool isVisible = true;
  bool processing = false;
  void logIn() async {
    setState(() {
      processing = true;
    });

    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email!,
          password: _password!,
        );
        Navigator.pushReplacementNamed(context, '/customer_page');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          setState(() {
            processing = false;
          });
          SnackBarWidget.snackBar('No user found for that email.', scaffoldKey);
        } else if (e.code == 'wrong-password') {
          SnackBarWidget.snackBar(
              'Wrong password provided for that user.', scaffoldKey);

          setState(() {
            processing = false;
          });
        }
      }
    } else {
      setState(() {
        processing = false;
      });
      SnackBarWidget.snackBar('Please fill your blank', scaffoldKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          reverse: true,
          child: Stack(
            children: [
              Column(children: [
                Center(
                  child: Image.asset(
                    "assets/images/signIn.png",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (value) {
                      _email = value;
                    },
                    controller: emailConroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13)),
                      labelText: 'Логин',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Obx(() => TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please fill your password";
                          } else {
                            return null;
                          }
                        },
                        obscureText: _controller.isVisible.value,
                        onChanged: (value) {
                          _controller.password.value = value;
                          log("password ====> ${_controller.password}");
                        },
                        controller: _controller.passwordConroller,
                        decoration: InputDecoration(
                          hintText: 'Please enter your password',
                          suffixIcon: IconButton(
                            icon: Icon(_controller.isVisible.value == true
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              _controller.isVisible.value =
                                  !_controller.isVisible.value;
                            },
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13)),
                          labelText: 'Пароль',
                        ),
                      )),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(AppText.alHaveAcc,
                            style: AppTextStyle.w600Gen16),
                        TextButton(
                          onPressed: () {
                            Get.to(
                              const RegistView(),
                            );
                          },
                          child: const Text(AppText.signUp,
                              style: AppTextStyle.w500Gen17),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 155),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const Text("Did you choose the wrong category?",
                              textAlign: TextAlign.center,
                              style: AppTextStyle.w600Gen14),
                          SizedBox(
                            height: height * 0.001,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 70),
                            child: TextButton(
                              onPressed: () {
                                Get.to(WelcomeView());
                              },
                              child: const Text(
                                "Back in welcome screen",
                                style: AppTextStyle.w500Gen15,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                processing == true
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.whiteF5,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          AuthController.instance.login(
                            _controller.emailConroller.text.trim(),
                            _controller.passwordConroller.text.trim(),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.97,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.black53,
                          ),
                          child: const Center(
                            child: Text(
                              'Продолжить',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
