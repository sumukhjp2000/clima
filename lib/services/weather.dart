import 'package:clima/services/networking.dart';
import 'package:flutter/services.dart';
import 'location.dart';

const APIkey = 'API KEY'; //699a85d77e6ac23289adcb7a9e53701d
class WeatherModel {
  Future<dynamic> getCityLocation(String cityName) async {

    NetworkHelper net = await NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$APIkey&units=metric');
    var weatherData = await net.getData();
    return weatherData;
  }
  Future<dynamic> getLocation() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    NetworkHelper net = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${loc.lat}&lon=${loc.long}&appid=$APIkey&units=metric');
    var weatherData = await net.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 27) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
