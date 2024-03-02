import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/helper/app_functions.dart';
import 'package:weather_app/model/user_model.dart';
import 'package:weather_app/screen/view/auth/login/view/login_view.dart';

class FirebaseRepository {
  static var fAuth = FirebaseAuth.instance;

  static Future<UserModel> signupRepo(String email, String password) async {
    try {
      UserCredential credential = await fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return UserModel(email: email, uid: credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<UserModel> loginRepo(String email, String password) async {
    try {
      UserCredential credential = await fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return UserModel(email: email, uid: credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<void> forgotPassword(
    String email,
  ) async {
    try {
      await fAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<void> signout(BuildContext context) async {
    try {
      fAuth.signOut().then((value) =>
          AppFunctions.nextRemoveUntilScreen(LoginView.route, context));
      var sf = await SharedPreferences.getInstance();
      sf.remove("loggedInUser");
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
