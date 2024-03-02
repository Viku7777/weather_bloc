import 'package:hive/hive.dart';
import 'package:weather_app/model/user_model.dart';
import 'package:weather_app/model/weather_model.dart';

class HiveBoxes {
  static Box<UserModel> userBox() => Hive.box<UserModel>("currentUser");
  static Box<WeatherModel> weatherBox() =>
      Hive.box<WeatherModel>("lastWeatherUser");
}
