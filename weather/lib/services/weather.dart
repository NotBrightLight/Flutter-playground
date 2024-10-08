import 'package:weather/services/location.dart';
import '../services/networking.dart';

const String apiKey = 'xxx';
const String openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  // Fetch weather by city name
  Future<dynamic> getCityWeather(String cityName) async {
    final String url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    return await _fetchWeatherData(url);
  }

  // Fetch weather based on current location
  Future<dynamic> getLocationData() async {
    try {
      Location location = Location();
      await location.getCurrentLocation();

      final String url = '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
      return await _fetchWeatherData(url);
    } catch (e) {
      print('Error fetching location data: $e');
      return null;
    }
  }

  // Unified function to handle networking calls
  Future<dynamic> _fetchWeatherData(String url) async {
    try {
      Networking networking = Networking(url: url);
      var weatherData = await networking.fetchWeather();
      return weatherData;
    } catch (e) {
      print('Error fetching weather data: $e');
      return null;
    }
  }

  // Return appropriate weather icon based on condition code
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

  // Provide message based on temperature
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
