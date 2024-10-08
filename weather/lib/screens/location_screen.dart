import 'package:weather/screens/city_screen.dart';
import 'package:weather/services/weather.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeatherData});

  final locationWeatherData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int temperature = 0;
  int condition = 0;
  String cityName = '';
  String weatherMessage = '';
  String weatherIcon = '';

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeatherData);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      print(weatherData);
      if (weatherData == null) {
        temperature = 0;
        cityName = '';
        weatherMessage = 'Cannot load the data';
        weatherIcon = ':(';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherMessage = weatherModel.getMessage(temperature);
      weatherIcon = weatherModel.getWeatherIcon(condition);
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () async {
                        var weatherData = await weatherModel.getLocationData();
                        updateUI(weatherData);
                      },
                      icon: const Icon(
                        Icons.near_me,
                        size: 40.0,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        var typedCityName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CityScreen(),
                          ),
                        );
                        if (typedCityName != null) {
                          var weatherData = await weatherModel.getCityWeather(typedCityName);
                          updateUI(weatherData);
                        }
                      },
                      icon: const Icon(
                        Icons.location_city,
                        size: 40.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Text(
                      '$temperature°',
                      style: kTempTextStyle.copyWith(
                        fontSize: 80.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle.copyWith(
                        fontSize: 80.0,
                        color: Colors.yellowAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, bottom: 40.0),
                child: Text(
                  "$weatherMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle.copyWith(
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
