import 'dart:ui';

import 'package:flutter/material.dart';

List backgroundFilterView = [
  Align(
    alignment: const AlignmentDirectional(3, -.3),
    child: Container(
      height: 300,
      width: 300,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.deepPurple),
    ),
  ),
  Align(
    alignment: const AlignmentDirectional(-3, -.3),
    child: Container(
      height: 300,
      width: 300,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.deepPurple),
    ),
  ),
  Align(
    alignment: const AlignmentDirectional(0, -1.2),
    child: Container(
      height: 300,
      width: 300,
      decoration: const BoxDecoration(color: Color(0xffffAB40)),
    ),
  ),
  BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
    child: Container(
      decoration: const BoxDecoration(color: Colors.transparent),
    ),
  ),
];
