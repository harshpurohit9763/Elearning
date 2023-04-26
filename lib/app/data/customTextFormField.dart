import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:learning/app/data/constant.dart';

class CustomTextFieldForm extends StatelessWidget {
  CustomTextFieldForm({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    required this.isobscre,
  });
  TextEditingController controller;
  IconData icon;
  String hintText;
  RxBool isobscre = false.obs;
  @override
  Widget build(BuildContext context) {
    ConstantColors concolor = ConstantColors();

    return TextFormField(
      onChanged: (value) {
        controller.value == value;
      },
      obscureText: isobscre.value,
      decoration: InputDecoration(
        icon: Icon(
          icon,
          size: 32,
        ),
        iconColor: concolor.secondarycolor,
        hintText: hintText,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: concolor.secondarycolor,
            ),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
