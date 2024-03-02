class WeatherModel {
  final String city;
  final int weatherRange;
  final int currentTemp;
  final String currentWeatherType;
  final DateTime lastUpdate;
  final DateTime sunrise;
  final DateTime sunset;
  final int tempMax;
  final int tempMin;

  WeatherModel(
      this.city,
      this.weatherRange,
      this.currentTemp,
      this.currentWeatherType,
      this.lastUpdate,
      this.sunrise,
      this.sunset,
      this.tempMax,
      this.tempMin);
}
