// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class UserSignUpEvent extends SignupEvent {
  final String email;
  final String password;
  UserSignUpEvent({
    required this.email,
    required this.password,
  });
}
