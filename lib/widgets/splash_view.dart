import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/weather_model.dart';
import '../providers/weather_providers.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation <Offset>slidigAnimation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    slidigAnimation = Tween<Offset>(begin: Offset(0,3) ,end: Offset.zero).animate(animationController);
    slidigAnimation.addListener(() {
      setState(() {
    });
    });
    animationController.forward();


  }

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData =
        Provider.of<WeatherProviders>(context).weatherData;
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //  crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/thunderstorm.png',
                width: 100,
              ),

              SlideTransition(
                position: slidigAnimation,
                  child:  Text(
                'Weather App',
                style: TextStyle(fontSize: 60, color: Colors.white),
              )),

               Text('Real time weather alerts',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
