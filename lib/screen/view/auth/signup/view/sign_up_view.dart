// ignore_for_file: must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/helper/app_functions.dart';
import 'package:weather_app/helper/btns.dart';
import 'package:weather_app/helper/colors.dart';
import 'package:weather_app/helper/textstyle.dart';
import 'package:weather_app/screen/component/background_component.dart';
import 'package:weather_app/screen/component/custom_textfiled.dart';
import 'package:weather_app/screen/view/auth/signup/bloc/signup_bloc.dart';
import 'package:weather_app/screen/view/home/view/home_view.dart';
import 'package:weather_app/screen/view/auth/login/view/login_view.dart';

class SignUpView extends StatelessWidget {
  static String route = "/signup_view";
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ...backgroundFilterView,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
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
                  BlocConsumer<SignupBloc, SignupState>(
                    listener: (context, state) {
                      if (state is ErrorState) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(state.error)));
                      } else if (state is SuccessState) {
                        AppFunctions.nextRemoveUntilScreen(
                            WeatherHomeView.route, context);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content:
                              Text("You're successfully create your account.."),
                          backgroundColor: Colors.green,
                        ));
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          CustomTextFiled.primaryTextFiled(
                              "Email", emailController),
                          10.heightBox,
                          CustomTextFiled.primaryTextFiled(
                              "Password", passwordController),
                          25.heightBox,
                          if (state is LoadingState)
                            const Center(
                              child: CircularProgressIndicator(),
                            )
                          else
                            AppBtns.primaryBtn("Sign up", () {
                              context.read<SignupBloc>().add(UserSignUpEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                            }),
                        ],
                      );
                    },
                  ),
                  15.heightBox,
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(text: "Already have an Account? "),
                    TextSpan(
                        text: "Login",
                        style: AppTextStyle.s14Med
                            .copyWith(color: AppColor.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              AppFunctions.nextScreen(LoginView.route, context))
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
