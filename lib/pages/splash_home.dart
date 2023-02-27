import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:digitalbank/controllers/transaction_controller.dart';
import 'package:digitalbank/helper/local_storage.dart';
import 'package:digitalbank/pages/card/Cards.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashHome extends ConsumerWidget {
  const SplashHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(GlobalProviders);
    return AnimatedSplashScreen(
      function: () async {
        localstorage();
      },
      duration: 1000,
      backgroundColor: Colors.white,
      splash: Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
          color: AppColors.mainColor,
        ),
      ),
      nextScreen: Cards(),
      splashTransition: SplashTransition.rotationTransition,
    );
  }
}
