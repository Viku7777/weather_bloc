import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/helper/btns.dart';
import 'package:weather_app/screen/component/background_component.dart';
import 'package:weather_app/screen/component/custom_textfiled.dart';
import 'package:weather_app/screen/view/auth/forgot/bloc/forgot_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  static String routes = "forgot_password";
  var emailController = TextEditingController();

  ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Stack(
        children: [
          ...backgroundFilterView,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                20.heightBox,
                BlocConsumer<ForgotBloc, ForgotState>(
                  listener: (context, state) {
                    if (state is ForgotErrorState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.error)));
                    } else if (state is ForgotSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "We send an email on your registed email, please check instructions "),
                        backgroundColor: Colors.green,
                      ));
                    }
                  },
                  builder: (context, state) {
                    if (state is ForgotLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return AppBtns.primaryBtn("Forgot Password", () {
                        context.read<ForgotBloc>().add(
                            ForgotPasswordEvent(email: emailController.text));
                      });
                    }
                  },
                )
                // RichText(
                //     text: TextSpan(children: [
                //   const TextSpan(text: "Already have an Account? "),
                //   TextSpan(
                //       text: "Login",
                //       style: AppTextStyle.s14Med
                //           .copyWith(color: AppColor.primaryColor),
                //       recognizer: TapGestureRecognizer()
                //         ..onTap = () =>
                //             AppFunctions.nextScreen(LoginView.route, context))
                // ]))
              ],
            ),
          )
        ],
      ),
    );
  }
}
