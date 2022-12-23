import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobx_tutorial/models/weather_model.dart';

class WeatherService {
  late Dio dio;

  WeatherService() {
    this.dio = Dio();
  }

  Future<WeatherModel> getCurrentWeather() async {
    try {
      var res = await dio.get(
          "https://api.weatherapi.com/v1/current.json?q=London&key=be6c7f3266294d5997071446222012");
      log("RES => ${res.data}");
      return WeatherModel.fromJson(res.data);
    } catch (e) {
      log("Error getting weather : $e");
      throw Exception("Couldn\'t get the weather data");
    }
  }
}
