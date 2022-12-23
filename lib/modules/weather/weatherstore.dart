import 'package:mobx/mobx.dart';
import 'package:mobx_tutorial/backend/weather_service.dart';
import 'package:mobx_tutorial/models/weather_model.dart';

part 'weatherstore.g.dart';

class WeatherController = _WeatherControllerBase with _$WeatherController;

abstract class _WeatherControllerBase with Store {
  @observable
  String firstName = "KP";

  @observable
  String lastName = " Simform";

  @computed
  String get fullName => firstName + lastName;

  @observable
  ObservableList<String> nameList = ObservableList<String>();

  @observable
  Observable<WeatherModel> weather =
      Observable<WeatherModel>(name: 'abc', WeatherModel());

  @action
  getWeather() async {
    try {
      var res = await WeatherService().getCurrentWeather();
      weather.value = res;
      print(res.current!.tempC);
      print("WEATHER UPDATE => ${weather.value.current!.tempC}");
    } catch (e) {
      print(e);
    }
  }
}
