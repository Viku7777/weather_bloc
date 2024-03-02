// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'login_bloc_bloc.dart';

sealed class LoginBlocEvent {}

class LoginEvent extends LoginBlocEvent {
  String email;
  String password;
  LoginEvent({
    required this.email,
    required this.password,
  });
}
