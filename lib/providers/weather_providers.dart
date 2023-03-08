import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class WeatherProviders extends ChangeNotifier{
   WeatherModel?_weatherData; // Private
  String? cityName='Gaza';
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }
  WeatherModel? get weatherData => _weatherData;}