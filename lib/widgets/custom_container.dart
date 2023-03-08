import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/weather_model.dart';
import '../pages/home_page.dart';
import '../providers/weather_providers.dart';

class ConatinerText extends StatelessWidget {
  WeatherModel? a ;
  @override
  ConatinerText({ required this.name , this.onTap});
  String ?name;
  VoidCallback ?onTap;
  Widget build(BuildContext context) {
   WeatherModel? weatherData = Provider.of<WeatherProviders>(context).weatherData;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        height: 40,
        decoration: BoxDecoration(
            color: weatherData!.getThemeColor()[400], borderRadius: BorderRadius.circular(13)),
        child: Center(
            child: Text(
       name!,
          style: const TextStyle(fontSize: 30 , color: Colors.white ,),
        )),
      )
    );
    ;
  }
}
// fontFamily: 'Pacifico'