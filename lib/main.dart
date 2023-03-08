import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/pages/home_page.dart';
import 'package:weatherapp/pages/into_page.dart';
import 'package:weatherapp/pages/search_page.dart';
import 'package:weatherapp/providers/weather_providers.dart';
import 'package:weatherapp/services/weather_services.dart';

import 'models/weather_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
      child: weatherApp(),
      create: (context) {
        return WeatherProviders();
      }));
}

class weatherApp extends StatefulWidget {
  @override
  State<weatherApp> createState() => _weatherAppState();
}

class _weatherAppState extends State<weatherApp> {
 build(BuildContext context)   {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch:
          Provider.of<WeatherProviders>(context).weatherData == null
                  ? Colors.blue
                  : Provider.of<WeatherProviders>(context)
                      .weatherData!
                      .getThemeColor()),
      debugShowCheckedModeBanner: false,
      home: into_screen(),
    );
  }
}
