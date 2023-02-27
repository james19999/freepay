import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:digitalbank/pages/auth/login.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:flutter/material.dart';

class Splashlogout extends StatelessWidget {
  const Splashlogout({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1000,
      backgroundColor: Colors.white,
      splash: Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
          color: AppColors.mainColor,
        ),
      ),
      nextScreen: Login(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
