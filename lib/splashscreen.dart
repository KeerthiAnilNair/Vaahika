import 'package:flutter/material.dart';
import 'package:sample_project/login.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 20,
      navigateAfterSeconds: Login(),
      backgroundColor: Colors.white,
      //imageBackground: AssetImage('assets/images/splash.png'),
      // image: Image.asset(
      //   'assets/images/splash.png',
      //   fit: BoxFit.cover,
      // ),

      loaderColor: Colors.transparent,
    );
  }
}
