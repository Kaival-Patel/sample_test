import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:mobx_tutorial/modules/weather/weatherstore.dart';
import 'package:mobx_tutorial/styles/app_assets.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherController weatherController = WeatherController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherController.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Observer(
            builder: (context) {
              print("RE RENDERED");
              var weather = weatherController.weather.value;
              if (weather.current.isDay == 1) {
                return DayWeather(WeatherType.Morning);
              } else if (weather.current.isDay == 0) {
                return DayWeather(WeatherType.Evening);
              } else if (weather.current.tempC < 10) {
                return DayWeather(WeatherType.Snowy);
              }
              return DayWeather(WeatherType.Morning);
            },
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Observer(builder: (context) {
                print("RE RENDERED WEATHER TEXT");
                var weather = weatherController.weather.value;
                return DayWeatherTemp(
                    tempInCelsius: weather.current.tempC.toString());
              }),
            ),
          ),
        ],
      ),
    );
  }
}

enum WeatherType { Morning, Evening, Snowy }

class DayWeatherTemp extends StatelessWidget {
  String tempInCelsius;

  DayWeatherTemp({required this.tempInCelsius});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: tempInCelsius,
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 100,
              fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: "°C",
              style: TextStyle(
                color: Colors.white.withOpacity(0.95),
                fontSize: 20,
              ),
            ),
          ]),
    );
  }
}

class DayWeather extends StatelessWidget {
  WeatherType type;

  DayWeather(this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = context.mediaQuery.size;
    switch (type) {
      case WeatherType.Morning:
        return Image.asset(
          AppAssets.morningBg,
          fit: BoxFit.cover,
          width: size.width,
          height: size.height,
        );
      case WeatherType.Evening:
        return Image.asset(
          AppAssets.eveningBg,
          fit: BoxFit.cover,
          width: size.width,
          height: size.height,
        );
      case WeatherType.Snowy:
        return Image.asset(
          AppAssets.snowBg,
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
        );
    }
  }
}
