// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:aplication/app/constans/app_colors.dart';
import 'package:aplication/app/constans/app_text_styles.dart';
import 'package:aplication/app/modules/auth/controllers/auth_controller.dart';
import 'package:aplication/app/modules/welcom/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends GetView<AuthController> {
  AuthView({Key? key}) : super(key: key);

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final GlobalKey<ScaffoldMessengerState> scaffoldKey =
  //     GlobalKey<ScaffoldMessengerState>();
  // var emailConroller = TextEditingController();
  // var passwordConroller = TextEditingController();
  final _controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ScaffoldMessenger(
        key: _controller.scaffoldKey,
        child: Scaffold(
          body: SafeArea(
            child: Form(
              key: _controller.formKey,
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                   height: height * 0.45,
                  width: width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(105.0),
                            bottomRight: Radius.circular(105.0))),
                    child: Center(
                      child: Image.asset(
                        "assets/images/photo.png",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 90,
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
                        hintText: 'Please enter your gmail',
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
                  const SizedBox(
                    height: 120,
                  ),
                  InkWell(
                    onTap: () {
                      AuthController.instance.login(
                        _controller.emailConroller.text.trim(),
                        _controller.passwordConroller.text.trim(),
                      );
                    },
                    child: Container(
                      width: double.infinity,
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
              ),
            ),
          ),
        ));
  }
}

                  // Row(
                  //   // crossAxisAlignment: CrossAxisAlignment.end,
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Center(
                  //       child: Text(
                  //         "Did you choose the wrong category?",
                  //         textAlign: TextAlign.center,
                  //           style:AppTextStyle.w600Gen16
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       height: height * 0.02,
                  //     ),
                  //     TextButton(
                  //         onPressed: () {
                  //           Get.to(WelcomeView());
                  //         },
                  //         child: Text(
                  //           "Back in welcome screen",
                  //         style: AppTextStyle.w500Gen17,
                  //         )),
                  //   ],
                  // ),