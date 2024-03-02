import 'package:flutter/material.dart';
import 'package:weather_app/screen/view/home/view/change_location_view.dart';
import 'package:weather_app/screen/view/auth/forgot/view/forgot_password_view.dart';
import 'package:weather_app/screen/view/home/view/home_view.dart';
import 'package:weather_app/screen/view/auth/login/view/login_view.dart';
import 'package:weather_app/screen/view/auth/signup/view/sign_up_view.dart';
import 'package:weather_app/screen/view/splash/splash_view.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashView.route: (p0) => const SplashView(),
  LoginView.route: (p0) => LoginView(),
  SignUpView.route: (p0) => SignUpView(),
  WeatherHomeView.route: (p0) => const WeatherHomeView(),
  ChangeLocationView.routes: (p0) => const ChangeLocationView(),
  ForgotPasswordView.routes: (p0) => ForgotPasswordView(),
};
