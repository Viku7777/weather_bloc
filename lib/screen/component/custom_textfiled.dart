import 'package:flutter/material.dart';

class CustomTextFiled {
  static primaryTextFiled(String name, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration:
          InputDecoration(hintText: name, border: const OutlineInputBorder()),
    );
  }
}
