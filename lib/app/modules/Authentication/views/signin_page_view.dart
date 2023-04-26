import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning/app/data/constant.dart';
import 'package:learning/app/data/customButton.dart';
import 'package:learning/app/data/customTextFormField.dart';
import 'package:learning/app/modules/Authentication/controllers/authentication_controller.dart';
import 'package:learning/app/modules/Authentication/views/signup_page_view.dart';

class SigninPageView extends GetView {
  const SigninPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ConstantColors concolor = ConstantColors();
    AuthenticationController authCtrl = Get.find<AuthenticationController>();
    TextEditingController mailId = TextEditingController();
    TextEditingController password = TextEditingController();

    return authCtrl.isLoading.value
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/loginLogo.svg',
                        height: Get.height * 0.5),
                    CustomTextFieldForm(
                      isobscre: false.obs,
                      controller: mailId,
                      icon: EvaIcons.emailOutline,
                      hintText: "Mail",
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    CustomTextFieldForm(
                      isobscre: true.obs,
                      controller: password,
                      icon: EvaIcons.lockOutline,
                      hintText: "password",
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    GestureDetector(
                      onTap: () {
                        authCtrl.signin();
                      },
                      child: customButton(
                        color: concolor.primarycolor as Color,
                        height: 60,
                        width: Get.width,
                        radius: 10,
                        widget: Center(
                            child: Text(
                          "Login",
                          style: GoogleFonts.openSans(
                            color: concolor.lightmode,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Text("Dont Have An Account?"),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => SignupPageView());
                        },
                        child: Text("Sign up")),
                  ],
                ),
              ),
            ),
          ));
  }
}
