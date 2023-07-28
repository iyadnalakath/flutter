import 'package:dice/services/location.dart';
import 'package:dice/services/networking.dart';


const apiKey = 'e45e7eeafff52fd932afcd432a857f2d';
const openweatherMap = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic>getCityWeather(String cityName) async{

    Uri url = Uri.parse('$openweatherMap?q=$cityName&appid=$apiKey&units=metric');
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic>getLocationweather() async{

    Location location = Location();
    await location.getCurrentLocation();
    Uri apiUrl = Uri.parse(
        '$openweatherMap?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    NetworkHelper networkHelper = NetworkHelper(apiUrl);
    var weatherData = await networkHelper.getData();
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
