import 'package:flutter/material.dart';
import 'package:weather_app/helper/colors.dart';
import 'package:weather_app/helper/textstyle.dart';

class AppBtns {
  static Widget primaryBtn(String name, VoidCallback onclick) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            fixedSize: const Size(double.maxFinite, 55)),
        onPressed: onclick,
        child: Text(
          name,
          style: AppTextStyle.s14Bold,
        ));
  }
}
