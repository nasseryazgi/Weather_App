import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/pages/search_page.dart';

import '../models/weather_model.dart';
import '../providers/weather_providers.dart';
import '../services/weather_services.dart';
import '../widgets/custom_container.dart';
import 'home_page.dart';

class into_screen extends StatelessWidget {
  const into_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData =
        Provider.of<WeatherProviders>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Weather App' ,style: TextStyle(color: Colors.white ,fontFamily: 'Pacifico' ),),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                weatherData!.getThemeColor(),
                weatherData.getThemeColor()[300]!,
                weatherData.getThemeColor()[100]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
         ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/thunderstorm.png',
              width: 100,
            ),
            Text('Welcome to Weather App' ,style: TextStyle(fontSize: 30 ,color: Colors.white),) ,
            Text('Find out all the weather data for your ',style: TextStyle(fontSize: 15 ,color: Colors.black)) ,

            ConatinerText(
              name: 'Use  Current Location',
              onTap: () async {
                WeatherService services = WeatherService();
                WeatherModel? WeatherObject = await services.getWeather(cityName: 'Gaza');
                Provider.of<WeatherProviders>(context, listen: false).cityName = 'Gaza';
                Provider.of<WeatherProviders>(context, listen: false).weatherData = WeatherObject;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              },
            ),
            ConatinerText(
              name: 'Use Different Location',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
