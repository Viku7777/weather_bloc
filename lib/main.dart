import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/screen/view/auth/forgot/bloc/forgot_bloc.dart';
import 'package:weather_app/screen/view/home/bloc/home_bloc.dart';
import 'package:weather_app/helper/firebase_options.dart';
import 'package:weather_app/helper/routes.dart';
import 'package:weather_app/screen/view/auth/login/bloc/login_bloc_bloc.dart';
import 'package:weather_app/screen/view/auth/signup/bloc/signup_bloc.dart';
import 'package:weather_app/screen/view/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
//143@Vixh

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TempBloc(),
        ),
        BlocProvider(
          create: (context) => SignupBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBlocBloc(),
        ),
        BlocProvider(
          create: (context) => ForgotBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Weather',
        routes: routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.transparent,
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
            )),
        initialRoute: SplashView.route,
      ),
    );
  }
}
