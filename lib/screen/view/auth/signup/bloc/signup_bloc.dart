import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/model/user_model.dart';
import 'package:weather_app/repository/repository.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<UserSignUpEvent>(_signup);
  }
  void _signup(UserSignUpEvent event, Emitter<SignupState> emit) async {
    emit(LoadingState());
    await FirebaseRepository.signupRepo(event.email, event.password)
        .then((UserModel value) async {
      var sf = await SharedPreferences.getInstance();
      sf.setString("loggedInUser", jsonEncode(value.toMap()));
      emit(SuccessState());
    }).catchError((e) {
      emit(ErrorState(e.toString()));
    });
  }
}
