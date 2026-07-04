import 'package:flutter/material.dart';
import 'package:spotify_clone/repository/screens/create_account/create_account_screen.dart';
import 'package:spotify_clone/repository/screens/intro/intro_screen.dart';
import 'package:spotify_clone/repository/screens/splash/splash_screen.dart';

class AppRoutes {
  static const splashScreen = "/splashScreen";
  static const introScreen = "/introScreen";
  static const createAccountScreen = "/createAccountScreen";

  static Map<String, Widget Function(BuildContext)> getRoutes() => {
    splashScreen: (context) => SplashScreen(),
    introScreen: (context) => IntroScreen(),
    createAccountScreen: (context) => CreateAccountScreen(),
  };
}
