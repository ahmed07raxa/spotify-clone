import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify Clone',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "avenir"
      ),
      initialRoute: AppRoutes.introScreen,
      routes: AppRoutes.getRoutes(),
    );
  }
}
