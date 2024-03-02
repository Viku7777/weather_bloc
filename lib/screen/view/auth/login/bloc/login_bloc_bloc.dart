import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/repository/repository.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc() : super(LoginBlocInitial()) {
    on<LoginEvent>(_login);
  }
  void _login(LoginEvent event, Emitter<LoginBlocState> emit) async {
    emit(LoginLoadingState());
    await FirebaseRepository.loginRepo(event.email, event.password)
        .then((value) async {
      var sf = await SharedPreferences.getInstance();
      sf.setString("loggedInUser", jsonEncode(value.toMap()));
      emit(LoginSuccessState());
    }).catchError((e) {
      emit(LoginErrorState(error: e.toString()));
    });
  }
}
