// ignore_for_file: must_be_immutable

part of 'forgot_bloc.dart';

sealed class ForgotState {}

final class ForgotInitial extends ForgotState {}

final class ForgotLoading extends ForgotState {}

final class ForgotErrorState extends ForgotState {
  String error;
  ForgotErrorState(this.error);
}

final class ForgotSuccess extends ForgotState {}
