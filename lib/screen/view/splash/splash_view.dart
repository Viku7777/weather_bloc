import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/helper/app_functions.dart';
import 'package:weather_app/screen/component/background_component.dart';
import 'package:weather_app/screen/view/auth/signup/view/sign_up_view.dart';
import 'package:weather_app/screen/view/home/view/home_view.dart';
import 'package:weather_app/screen/view/auth/login/view/login_view.dart';

class SplashView extends StatefulWidget {
  static String route = "/splash_view";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    selectRoute();
    super.initState();
  }

  selectRoute() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () async {
        await SharedPreferences.getInstance().then((value) {
          if (value.getString("loggedInUser") == null) {
            AppFunctions.nextRemoveUntilScreen(LoginView.route, context);
          } else {
            AppFunctions.nextRemoveUntilScreen(WeatherHomeView.route, context);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ...backgroundFilterView,
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/7.png",
                  scale: 2,
                ),
                const Text("Loading...")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
