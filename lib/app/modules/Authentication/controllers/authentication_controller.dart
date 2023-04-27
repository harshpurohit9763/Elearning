import 'package:elearning/app/data/constant.dart';
import 'package:elearning/app/modules/Authentication/views/authentication_view.dart';
import 'package:elearning/app/modules/Authentication/views/signin_page_view.dart';
import 'package:elearning/app/modules/Authentication/views/signup_page_view.dart';
import 'package:elearning/app/modules/home/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  ConstantValues constant = ConstantValues();
  RxBool isLoading = false.obs;

  Popup() {
    Get.defaultDialog();
  }

  Signin(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (FirebaseAuth.instance.currentUser!.uid.isNotEmpty) {
      Get.offAll(HomeView());
    }
    if (FirebaseAuth.instance.currentUser!.uid.isEmpty) {
      EasyLoading.showError("Please Login");
    }
  }

  Signup(String email, String password, String name, String idNumber,
      String phoneNumber) async {
        isLoading(true);
    var credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await constant.auth.currentUser?.updateDisplayName(name);
    await constant.auth.currentUser?.updateEmail(email);
    await constant.firebase.collection('Users').doc(credential.user?.uid).set({
      "name": name,
      "email": email,
      "uid": constant.auth.currentUser?.uid.toString(),
      "profile_pic":
          "https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651__340.png",
      "chatroom": [],
      "idNumber": idNumber,
      "phone-Number": phoneNumber,
    });
    isLoading(false);
    if (FirebaseAuth.instance.currentUser!.uid.isNotEmpty) {
      Get.offAll(HomeView());
    }
    if (FirebaseAuth.instance.currentUser!.uid.isEmpty) {
      EasyLoading.showError("Please Login");
    }
  }

  signout() {
    FirebaseAuth.instance.signOut();
    Get.offAll(AuthenticationView());
  }
}
