import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  Future<WeatherModel?> getWeather({ String cityName='Gaza'}) async {
    WeatherModel? weathermodel;
    try {
      String baseUrl = 'http://api.weatherapi.com/v1';
      String apiKey = '508c83a0d0924c6d96d93623231202';
      Uri url =
      Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weathermodel = WeatherModel.fromJson(data);
    } catch (e) {
      print('Error $e');
    }
    return weathermodel;
  }
}
