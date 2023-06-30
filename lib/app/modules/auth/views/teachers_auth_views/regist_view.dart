import 'package:aplication/app/constans/app_colors.dart';
import 'package:aplication/app/constans/app_text.dart';
import 'package:aplication/app/constans/app_text_styles.dart';
import 'package:aplication/app/modules/auth/views/teachers_auth_views/signIn_view.dart';
import 'package:aplication/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RegistView extends StatelessWidget {
  RegistView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  var emailConroller = TextEditingController();
  var namelConroller = TextEditingController();
  var passwordConroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
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
                    Container(
                      child: Center(
                          child: Text("Registration",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Gentium"))),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 10, right: 10),
                      child: TextField(
                        controller: namelConroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13)),
                          labelText: 'Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: emailConroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13)),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: passwordConroller,
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
                    InkWell(
                      onTap: () {
                        Get.to(
                          HomeView(),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.97,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.black53,
                        ),
                        child: Center(
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
