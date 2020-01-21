import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  final _baseUrl =
      'http://api.openweathermap.org/data/2.5/weather?';
  //final _apiKey = ''
  final _apiKey = 'b3177c68ab3f7d3a3c12a5f99ec43380';
  Future<dynamic> getWeatherByCity(String city) async {}

  Future<dynamic> getWeatherByLocation() async {
    final locator = Location();
    final position = await locator.getLocation();

    final networkHelper = NetworkingHelper();
    final weather = await networkHelper.getData(
        '${_baseUrl}lat=${position.latitude}&lon=${position.longitude}&appid=$_apiKey&units=metric');
    return weather;
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
    if (temp > 25) {
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
