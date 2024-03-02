// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather/weather.dart';

class TempAppState {}

class TempInitialState extends TempAppState {}

class TempLoadingState extends TempAppState {}

class TempFailedState extends TempAppState {
  String error;
  TempFailedState({
    required this.error,
  });
}

class TempSuccessState extends TempAppState {
  final Weather weather;
  TempSuccessState(this.weather);
}
