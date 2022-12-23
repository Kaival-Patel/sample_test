import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    this.current = const Current(),
  });

  Current current;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        current: json["current"] == null
            ? Current()
            : Current.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
        "current": current == null ? null : current!.toJson(),
      };
}

class Current {
  const Current({
    this.tempC = 0,
    this.tempF = 0,
    this.isDay = 0,
  });

  final int tempC;
  final int tempF;
  final int isDay;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        tempC: json["temp_c"] == null ? 1 : json["temp_c"].toInt(),
        tempF: json["temp_f"] == null ? 1 : json["temp_f"].toInt(),
        isDay: json["is_day"] == null ? 1 : json["is_day"].toInt(),
      );

  Map<String, dynamic> toJson() => {
        "temp_c": tempC == null ? null : tempC,
        "temp_f": tempF == null ? null : tempF,
        "is_day": isDay == null ? null : isDay,
      };
}
