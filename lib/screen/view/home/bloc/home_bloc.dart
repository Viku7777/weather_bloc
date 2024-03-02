// ignore_for_file: body_might_complete_normally_catch_error

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/screen/view/home/bloc/home_state.dart';
import 'package:weather_app/screen/view/home/bloc/home_event.dart';
import 'package:weather_app/configure/api_key.dart';

class TempBloc extends Bloc<TempAppEvent, TempAppState> {
  TempBloc() : super(TempInitialState()) {
    on<FatchTempEvent>(_fatch);
    on<ChangeTempWithLatLng>(_fatchWithLatlng);
  }

  void _fatch(FatchTempEvent event, Emitter emit) async {
    emit(TempLoadingState());
    try {
      LocationPermission requestPermission = await Geolocator.checkPermission();
      if (requestPermission.name == "denied" ||
          requestPermission.name == "deniedForever") {
        LocationPermission permission = await Geolocator.requestPermission();
        if (permission.name == "denied" || permission.name == "deniedForever") {
          emit(TempFailedState(error: "Please allow Location Permission"));
        }
      }
      await getTemp().then((value) {
        emit(TempSuccessState(value));
      }).catchError((e) {
        emit(TempFailedState(error: e));
      });
    } catch (e) {
      emit(TempFailedState(error: e.toString()));
    }
  }

  void _fatchWithLatlng(ChangeTempWithLatLng event, Emitter emit) async {
    emit(TempLoadingState());
    await getTemp(lat: event.lat, lng: event.lng)
        .then((value) => emit(TempSuccessState(value)))
        .catchError((e) {
      emit(TempFailedState(error: e));
    });
  }

  Future<Weather> getTemp({double? lat, double? lng}) async {
    try {
      WeatherFactory wf = WeatherFactory(apiKey, language: Language.ENGLISH);

      if (lat == null && lng == null) {
        Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        return await wf.currentWeatherByLocation(
            currentPosition.latitude, currentPosition.longitude);
      } else {
        return await wf.currentWeatherByLocation(lat!, lng!);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
