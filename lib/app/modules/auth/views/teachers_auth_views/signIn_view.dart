import 'package:aplication/app/constans/app_colors.dart';
import 'package:aplication/app/constans/app_text.dart';
import 'package:aplication/app/constans/app_text_styles.dart';
import 'package:aplication/app/modules/welcom/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  var emailConroller = TextEditingController();
  var passwordConroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
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
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
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
                child: TextField(
                  controller: passwordConroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13)),
                    labelText: 'Пароль',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(AppText.alHaveAcc,
                          style: AppTextStyle.w600Gen16),
                      TextButton(
                        onPressed: () {
                          Get.to(
                            SignInView(),
                          );
                        },
                        child: const Text(AppText.signUp,
                            style: AppTextStyle.w500Gen17),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      SizedBox(width: 20,),
                      Center(
                        child: Text("Did you choose the wrong category?",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.w600Gen16),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(WelcomeView());
                        },
                        child: const Text(
                          "Back in welcome screen",
                          style: AppTextStyle.w500Gen17,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              InkWell(
                onTap: () {
                  // AuthController.instance.login(
                  //   emailConroller.text.trim(),
                  //   passwordConroller.text.trim(),
                  // );
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
          ),
        ),
      ),
    );
  }
}
