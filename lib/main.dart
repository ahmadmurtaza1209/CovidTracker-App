import 'package:covid_tracker_app/screens/detail_screen.dart';
import 'package:covid_tracker_app/screens/home_screen.dart';
import 'package:covid_tracker_app/screens/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          duration: 1000,
          animationDuration: Duration(seconds: 5),
          splashIconSize: 130.0,
          splash: "Assets/images/virus.png",
          nextScreen: HomeScreen(),
          splashTransition: SplashTransition.rotationTransition,
          pageTransitionType: PageTransitionType.bottomToTop,
          backgroundColor: Color.fromARGB(255, 49, 49, 49),
        ));
  }
}
