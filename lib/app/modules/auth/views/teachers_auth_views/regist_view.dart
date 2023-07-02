import 'package:aplication/app/constans/app_colors.dart';
import 'package:aplication/app/constans/app_text.dart';
import 'package:aplication/app/constans/app_text_styles.dart';
import 'package:aplication/app/modules/auth/controllers/auth_controller.dart';
import 'package:aplication/app/modules/auth/views/teachers_auth_views/signIn_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// ignore: must_be_immutable
class RegistView extends StatefulWidget {
  const RegistView({Key? key}) : super(key: key);

  @override
  State<RegistView> createState() => _RegistViewState();
}

class _RegistViewState extends State<RegistView> {
  final _controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Form(
        key: _controller.formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: [
                  Column(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/1.png",
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
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10, left: 10, right: 10, top: 40),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please fill your name';
                        } else if (value.isValidEmail() == false) {
                          return 'Not Valid';
                        } else if (value.isValidEmail() == true) {
                          return null;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _controller.name.value;
                      },
                      controller: _controller.namelConroller,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please fill your email';
                        } else if (value.isValidEmail() == false) {
                          return 'Not Valid';
                        } else if (value.isValidEmail() == true) {
                          return null;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _controller.eMail.value;
                      },
                      controller: _controller.emailConroller,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please fill your password';
                        } else if (value.isValidEmail() == false) {
                          return 'Not Valid';
                        } else if (value.isValidEmail() == true) {
                          return null;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _controller.password.value;
                      },
                      controller: _controller.passwordConroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13)),
                        labelText: AppText.password,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(AppText.haveAcc,
                            style: AppTextStyle.w600Gen16),
                        TextButton(
                          onPressed: () {
                            Get.to(
                              const SignInView(),
                            );
                          },
                          child: const Text(AppText.signIn,
                              style: AppTextStyle.w500Gen17),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.register(
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
    );
  }
}
