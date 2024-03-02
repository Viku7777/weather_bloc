// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'forgot_bloc.dart';

sealed class ForgotEvent {}

class ForgotPasswordEvent extends ForgotEvent {
  String email;
  ForgotPasswordEvent({
    required this.email,
  });
}
