import 'package:flutter/material.dart';
import 'package:spotify_clone/repository/screens/intro/intro_screen.dart';
import 'package:spotify_clone/repository/screens/splash/splash_screen.dart';

class AppRoutes {
  static const splashScreen = "/splashScreen";
  static const introScreen = "/introScreen";

  static Map<String, Widget Function(BuildContext)> getRoutes() => {
    splashScreen: (context) => SplashScreen(),
    introScreen: (context) => IntroScreen(),
  };
}
