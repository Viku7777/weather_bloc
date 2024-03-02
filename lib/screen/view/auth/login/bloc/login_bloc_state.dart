// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'login_bloc_bloc.dart';

sealed class LoginBlocState {}

final class LoginBlocInitial extends LoginBlocState {}

class LoginLoadingState extends LoginBlocState {}

class LoginErrorState extends LoginBlocState {
  String error;
  LoginErrorState({
    required this.error,
  });
}

class LoginSuccessState extends LoginBlocState {}
