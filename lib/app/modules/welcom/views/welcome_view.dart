import 'package:aplication/app/constans/app_colors.dart';
import 'package:aplication/app/constans/app_text_styles.dart';
import 'package:aplication/app/modules/auth/views/admin_auth_view/auth_view.dart';
import 'package:aplication/app/modules/auth/views/teachers_auth_views/regist_view.dart';
import 'package:aplication/app/modules/auth/views/teachers_auth_views/signIn_view.dart';
//621555
import 'package:aplication/app/modules/welcom/widgets/log_sign_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  WelcomeView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.greyOA),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                              ),
                              child: SizedBox(
                                width: width * 0.4,
                                height: height * 0.06,
                                child: const Center(
                                  child: Text('Admnistration only',
                                      style: AppTextStyle.blackBlod20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Container( width: width * 0.2,
                              height: height * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                                color: AppColors.grey.withOpacity(0.7),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      LogSignWidget(
                                          title: 'Sign In',
                                          onTap: () {
                                            Get.to(
                                              AuthView(),
                                            );
                                          }),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.05,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.black53),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child:  SizedBox(
                                width: width * 0.6,
                                height: height * 0.07,
                                child: const Center(
                                  child: Text(
                                    'Teachers only',
                                    style: AppTextStyle.blackBlod20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Container(
                              width: width * 0.7,
                              height: height * 0.09,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                color: AppColors.grey.withOpacity(0.7),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    LogSignWidget(
                                      title: 'Sign In',
                                      onTap: () {
                                        Get.to(
                                          SignInView(),
                                        );
                                      },
                                    ),
                                    LogSignWidget(
                                      onTap: () {
                                        Get.to(
                                          RegistView(),
                                        );
                                      },
                                      title: 'Registration ',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
