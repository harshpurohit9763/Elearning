import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learning/app/data/constant.dart';
import 'package:learning/app/modules/Authentication/views/signin_page_view.dart';
import 'package:learning/app/modules/Authentication/views/signup_page_view.dart';
import 'package:learning/app/modules/home/views/home_view.dart';

import '../controllers/authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  AuthenticationView({Key? key}) : super(key: key);
  // AuthenticationController authCtrl = Get.find<AuthenticationController>();
  ConstantValues conval = ConstantValues();
  @override
  Widget build(BuildContext context) {
    return conval.auth.currentUser?.uid == null ? SigninPageView() : HomeView();
  }
}
