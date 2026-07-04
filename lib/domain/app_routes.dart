import 'package:flutter/material.dart';
import 'package:spotify_clone/repository/screens/create_account/create_account_screen.dart';
import 'package:spotify_clone/repository/screens/dashboard/dashboard_screen.dart';
import 'package:spotify_clone/repository/screens/intro/choose_artist_screen.dart';
import 'package:spotify_clone/repository/screens/intro/choose_podcast_screen.dart';
import 'package:spotify_clone/repository/screens/intro/intro_screen.dart';
import 'package:spotify_clone/repository/screens/library/profile_screen.dart';
import 'package:spotify_clone/repository/screens/splash/splash_screen.dart';

class AppRoutes {
  static const splashScreen = "/splashScreen";
  static const introScreen = "/introScreen";
  static const createAccountScreen = "/createAccountScreen";
  static const chooseArtistScreen = "/chooseArtistScreen";
  static const choosePodcastScreen = "/choosePodcastScreen";
  static const dashboardScreen = "/dashboardScreen";
  static const profileScreen = "/profileScreen";

  static Map<String, Widget Function(BuildContext)> getRoutes() => {
    splashScreen: (context) => SplashScreen(),
    introScreen: (context) => IntroScreen(),
    createAccountScreen: (context) => CreateAccountScreen(),
    chooseArtistScreen: (context) => ChooseArtistScreen(),
    choosePodcastScreen: (context) => ChoosePodcastScreen(),
    dashboardScreen: (context) => DashboardScreen(),
    profileScreen: (context) =>
        MyProfileNavScreen(profilePicPath: "assets/images/image 2.png"),
  };
}
