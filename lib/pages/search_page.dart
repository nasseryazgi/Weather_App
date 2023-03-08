
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/providers/weather_providers.dart';
import 'package:weatherapp/services/weather_services.dart';

import 'home_page.dart';

WeatherModel? weatherdata;
class SearchPage extends StatelessWidget {
  String? cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search  a City'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            onSubmitted: (data) async {
              cityname = data;

            },
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  child: const Icon(Icons.search),
                  onTap: () async {
                    WeatherService services = WeatherService();
                    WeatherModel? WeatherObject = await services.getWeather(cityName: cityname!);
                    Provider.of<WeatherProviders>(context, listen: false).cityName = cityname;
                    Provider.of<WeatherProviders>(context, listen: false).weatherData = WeatherObject;
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  },
                ),
                hintText: 'Enter city name',
                labelText: 'citycame',
                border: const OutlineInputBorder()),
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
