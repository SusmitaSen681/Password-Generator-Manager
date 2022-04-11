import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:password_generator_managing_app/page/homePage.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splashIconSize: 250,
        backgroundColor: Color(0xFF647dee),
        splash: image(),
        splashTransition: SplashTransition.rotationTransition,
        
        nextScreen: Home(),
        duration: 3000,
      ),
    );
    /*SplashScreen(
      backgroundColor: Color(0xFF647dee),
      image: image(),
      navigateAfterSeconds: new Home(),
      photoSize: 150,
      seconds: 5,
      loaderColor: Colors.amber,
    );*/
  }

  Image image() {
    return Image.asset('assests/images/gi.gif', height: 200, width: 200, fit: BoxFit.cover,);
  }
}
