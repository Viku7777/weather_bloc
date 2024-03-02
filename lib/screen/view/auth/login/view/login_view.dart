// ignore_for_file: must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/helper/app_functions.dart';
import 'package:weather_app/helper/btns.dart';
import 'package:weather_app/helper/colors.dart';
import 'package:weather_app/helper/hive_box.dart';
import 'package:weather_app/helper/textstyle.dart';
import 'package:weather_app/model/user_model.dart';
import 'package:weather_app/screen/component/background_component.dart';
import 'package:weather_app/screen/component/custom_textfiled.dart';
import 'package:weather_app/screen/view/auth/login/bloc/login_bloc_bloc.dart';
import 'package:weather_app/screen/view/auth/signup/bloc/signup_bloc.dart';
import 'package:weather_app/screen/view/auth/forgot/view/forgot_password_view.dart';
import 'package:weather_app/screen/view/home/view/home_view.dart';
import 'package:weather_app/screen/view/auth/signup/view/sign_up_view.dart';

class LoginView extends StatelessWidget {
  static String route = "/login_view";
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          ...backgroundFilterView,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (MediaQuery.of(context).size.height * .1).heightBox,
                  Image.asset(
                    "assets/7.png",
                    scale: 2,
                  ),
                  const Text(
                    "Weather App",
                    style: TextStyle(fontSize: 30),
                  ),
                  10.heightBox,
                  CustomTextFiled.primaryTextFiled("Email", emailController),
                  10.heightBox,
                  CustomTextFiled.primaryTextFiled(
                      "Password", passwordController),
                  5.heightBox,
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            AppFunctions.nextScreen(
                                ForgotPasswordView.routes, context);
                          },
                          child: const Text(
                            "Forgot Password",
                            style: TextStyle(color: Colors.white),
                          ))),
                  5.heightBox,
                  BlocConsumer<LoginBlocBloc, LoginBlocState>(
                    listener: (context, state) {
                      if (state is LoginErrorState) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(state.error)));
                      } else if (state is LoginSuccessState) {
                        AppFunctions.nextRemoveUntilScreen(
                            WeatherHomeView.route, context);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Welcome Back.."),
                          backgroundColor: Colors.green,
                        ));
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return AppBtns.primaryBtn("Login", () {
                          context.read<LoginBlocBloc>().add(LoginEvent(
                              email: emailController.text,
                              password: passwordController.text));
                        });
                      }
                    },
                  ),
                  15.heightBox,
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(text: "Don't have an Account? "),
                    TextSpan(
                        text: "Register Here",
                        style: AppTextStyle.s14Med
                            .copyWith(color: AppColor.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => AppFunctions.nextScreen(
                              SignUpView.route, context))
                  ]))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
