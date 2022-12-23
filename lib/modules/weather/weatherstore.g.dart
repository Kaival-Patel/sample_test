// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weatherstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherController on _WeatherControllerBase, Store {
  Computed<String>? _$fullNameComputed;

  @override
  String get fullName =>
      (_$fullNameComputed ??= Computed<String>(() => super.fullName,
              name: '_WeatherControllerBase.fullName'))
          .value;

  late final _$firstNameAtom =
      Atom(name: '_WeatherControllerBase.firstName', context: context);

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  late final _$lastNameAtom =
      Atom(name: '_WeatherControllerBase.lastName', context: context);

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  late final _$nameListAtom =
      Atom(name: '_WeatherControllerBase.nameList', context: context);

  @override
  ObservableList<String> get nameList {
    _$nameListAtom.reportRead();
    return super.nameList;
  }

  @override
  set nameList(ObservableList<String> value) {
    _$nameListAtom.reportWrite(value, super.nameList, () {
      super.nameList = value;
    });
  }

  late final _$weatherAtom =
      Atom(name: '_WeatherControllerBase.weather', context: context);

  @override
  Observable<WeatherModel> get weather {
    _$weatherAtom.reportRead();
    return super.weather;
  }

  @override
  set weather(Observable<WeatherModel> value) {
    _$weatherAtom.reportWrite(value, super.weather, () {
      super.weather = value;
    });
  }

  late final _$getWeatherAsyncAction =
      AsyncAction('_WeatherControllerBase.getWeather', context: context);

  @override
  Future getWeather() {
    return _$getWeatherAsyncAction.run(() => super.getWeather());
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
nameList: ${nameList},
weather: ${weather},
fullName: ${fullName}
    ''';
  }
}
