import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/pages/search_page.dart';

import '../models/weather_model.dart';
import '../providers/weather_providers.dart';
import '../widgets/custom_container.dart';
import 'into_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData =
        Provider.of<WeatherProviders>(context).weatherData;

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
            )
          ],
          title: const Text('Weather App'),
          centerTitle: true,
        ),
        body: weatherData != null
            ? Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    weatherData.getThemeColor(),
                    weatherData.getThemeColor()[300]!,
                    weatherData.getThemeColor()[100]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                child: Column(
                  children: [
                    const Spacer(
                      flex: 7,
                    ),
                    Text(
                      '${Provider.of<WeatherProviders>(context).cityName}',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      'Updated at:  ${weatherData.date} ',
                      style: TextStyle(fontSize: 30),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Row(
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        Image.asset(weatherData.getImage()),
                        const Spacer(
                          flex: 1,
                        ),
                        Text(
                          '${weatherData.temp.toInt()}',
                          style: const TextStyle(fontSize: 40),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Column(
                          children: [
                            Text('maxTemp : ${weatherData.maxTemp.toInt()}',
                                style: const TextStyle(fontSize: 20)),
                            Text('minTemp : ${weatherData.minTemp.toInt()}',
                                style: const TextStyle(fontSize: 20))
                          ],
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      '${weatherData.weatherStateName} ',
                      style: const TextStyle(fontSize: 30),
                    ),
                    const Spacer(
                      flex: 8,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return into_screen();
                          }));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 35, horizontal: 60),
                          height: 50,
                          decoration: BoxDecoration(
                              color: weatherData.getThemeColor()[400],
                              borderRadius: BorderRadius.circular(60)),
                          child: Center(
                              child: Text(
                              'Home Page',
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          )),
                        )),
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              )
            : Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'There is no weather 🥲',
                        style: TextStyle(fontSize: 35),
                      ),
                      Text('Star Searching Now ',
                          style: TextStyle(fontSize: 35)),
                    ],
                  ),
                ),
              ));
  }
}
