import 'package:elearning/app/modules/Authentication/views/signin_page_view.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elearning/app/data/constant.dart';
import 'package:elearning/app/data/customButton.dart';
import 'package:elearning/app/data/customTextFormField.dart';
import 'package:elearning/app/modules/Authentication/controllers/authentication_controller.dart';
import 'package:elearning/app/modules/Authentication/views/signup_page_view.dart';

class SignupPageView extends GetView {
  SignupPageView({Key? key}) : super(key: key);

  AuthenticationController authCtrl = Get.put(AuthenticationController());
  ConstantColors concolor = ConstantColors();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController idNumber = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                controller: name,
                icon: EvaIcons.person,
                hintText: "Name",
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CustomTextFieldForm(
                isobscre: false.obs,
                controller: email,
                icon: EvaIcons.emailOutline,
                hintText: "Mail",
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CustomTextFieldForm(
                isobscre: false.obs,
                controller: phoneNumber,
                icon: EvaIcons.phone,
                hintText: "phone Number",
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CustomTextFieldForm(
                isobscre: false.obs,
                controller: idNumber,
                icon: Icons.assignment_ind_outlined,
                hintText: "Student Id",
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CustomTextFieldForm(
                isobscre: true.obs,
                controller: password,
                icon: EvaIcons.lockOutline,
                hintText: "password",
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              GestureDetector(
                onTap: () {
                  print("The email: ${email.text}");
                  authCtrl.Signup(email.text, password.text, name.text, idNumber.text, phoneNumber.text,);
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
