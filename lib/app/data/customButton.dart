import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  customButton({
    super.key,
    required this.color,
    required this.height,
    required this.width,
    required this.radius,
    required this.widget,
  });
  double height;
  double width;
  double radius;
  Color color;
  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: widget,
    );
  }
}
