import 'package:elearning/app/modules/Authentication/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  AuthenticationController authCtrl = Get.find<AuthenticationController>();
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                child: Text("Hi"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
