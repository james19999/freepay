import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/pages/orboarding/orboarding.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: logo,
      nextScreen: PageviewPage(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
