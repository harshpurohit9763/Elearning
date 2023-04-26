import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning/app/data/constant.dart';
import 'package:learning/app/data/customButton.dart';
import 'package:learning/app/data/customTextFormField.dart';
import 'package:learning/app/modules/Authentication/controllers/authentication_controller.dart';
import 'package:learning/app/modules/Authentication/views/signin_page_view.dart';

class SignupPageView extends GetView {
  const SignupPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthenticationController authCtrl = Get.find<AuthenticationController>();
    ConstantColors concolor = ConstantColors();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/loginLogo.svg',
                  height: Get.height * 0.35),
              // SizedBox(
              //                   height: Get.height * 0.03,

              // ),
              CustomTextFieldForm(
                isobscre: false.obs,
                controller: authCtrl.name,
                icon: EvaIcons.person,
                hintText: "Name",
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CustomTextFieldForm(
                isobscre: false.obs,
                controller: authCtrl.email,
                icon: EvaIcons.emailOutline,
                hintText: "Mail",
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CustomTextFieldForm(
                isobscre: false.obs,
                controller: authCtrl.phoneNumber,
                icon: EvaIcons.phone,
                hintText: "phone Number",
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CustomTextFieldForm(
                isobscre: false.obs,
                controller: authCtrl.idNumber,
                icon: Icons.assignment_ind_outlined,
                hintText: "Student Id",
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CustomTextFieldForm(
                isobscre: true.obs,
                controller: authCtrl.password,
                icon: EvaIcons.lockOutline,
                hintText: "password",
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              GestureDetector(
                onTap: ()  {
                   authCtrl.signup();
                },
                child: customButton(
                  color: concolor.primarycolor as Color,
                  height: 60,
                  width: Get.width,
                  radius: 10,
                  widget: Center(
                      child: Text(
                    "Signup",
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
              Text("Already Have An Account?"),
              SizedBox(
                height: Get.height * 0.01,
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(() => SigninPageView());
                  },
                  child: Text(
                    "Sign up",
                    style: GoogleFonts.openSans(
                      color: concolor.darkmode,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
