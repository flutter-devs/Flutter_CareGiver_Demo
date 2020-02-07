import 'package:flutter/material.dart';
import 'package:home_care_app/constant/constant.dart';
import 'package:home_care_app/screen/homescreen.dart';
import 'package:home_care_app/screen/splash_screen_caregiver.dart';
import 'package:home_care_app/screen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Care App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      routes: <String, WidgetBuilder> {
        Constants.SPLASH_SCREEN: (BuildContext context) => AnimatedSplashScreen(),
        Constants.SPLASH_SCREEN_CAREGIVER: (BuildContext context) => SplashScreenCaregiver(),
        Constants.HOME_SCREEN: (BuildContext context) => HomeScreen(),
      },
      initialRoute: Constants.SPLASH_SCREEN,
    );
  }
}

