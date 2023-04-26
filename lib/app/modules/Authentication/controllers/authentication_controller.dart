import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:learning/app/data/constant.dart';
import 'package:learning/app/modules/Authentication/views/signup_page_view.dart';
import 'package:learning/app/modules/home/views/home_view.dart';

class AuthenticationController extends GetxController {
  ConstantValues constant = ConstantValues();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController idNumber = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isLoading = false.obs;

  signin() async {
    try {
      isLoading.value = true;
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .whenComplete(() => const HomeView());
    } catch (signinerror) {
      if (signinerror is FirebaseAuthException) {
        if (signinerror.code == 'user-not-found') {
          Get.to(() => SignupPageView());
        }
      }
    }
    isLoading.value = false;
  }

  signup() async {
    isLoading.value = true;

    try {
      var credential = await constant.auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      await constant.auth.currentUser?.updateDisplayName(name.text);
      await constant.auth.currentUser?.updateEmail(email.text);
      await constant.firebase
          .collection('Users')
          .doc(credential.user?.uid)
          .set({
        "name": name.text,
        "email": email.text,
        "uid": constant.auth.currentUser?.uid.toString(),
        "profile_pic":
            "https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659651__340.png",
        "chatroom": [],
        "idNumber": idNumber.text,
        "phone-Number": phoneNumber.text,
      }).whenComplete(() => Get.offAll(const HomeView()));
    } catch (signUpError) {
      if (signUpError is PlatformException) {
        if (signUpError.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          signin();
        }
      }
    }
    isLoading.value = false;
  }

  signout() {
    FirebaseAuth.instance.signOut();
  }
}
