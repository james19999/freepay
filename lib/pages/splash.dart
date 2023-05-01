import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/helper/local_storage.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/langue.dart';
import 'package:digitalbank/pages/orboarding/orboarding.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      // backgroundColor: AppColors.mainColor,
      splash: Image.asset(
        logo,
        fit: BoxFit.cover,
        height: 500,
        width: 200,
      ),
      // localstorage.mylangues==true? PageviewPage() :
      nextScreen:  Language(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
