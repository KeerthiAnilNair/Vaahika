import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_project/login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        appBarTheme: AppBarTheme(
          color: Colors.blue[800],
        ),
      ),
      home: AnimatedSplashScreen(
        duration: 1000,
        nextScreen: const Login(),
        splash: 'assets/images/light.png',
        splashTransition: SplashTransition.rotationTransition,
      ),
    );
  }
}
