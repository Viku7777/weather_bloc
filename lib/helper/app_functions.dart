import 'package:flutter/material.dart';

class AppFunctions {
  static nextScreen(String route, BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }

  static nextRemoveUntilScreen(String route, BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
  }
}
