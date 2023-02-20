import 'package:digitalbank/helper/local_storage.dart';
import 'package:digitalbank/models/cart_data.dart';
import 'package:digitalbank/pages/auth/login.dart';

import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/orboarding/orboarding.dart';
import 'package:digitalbank/pages/splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(fontFamily: "Helvetica").copyWith(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: AppColors.mainColor,
              )),
      home: Splash(),
    );
  }
}
