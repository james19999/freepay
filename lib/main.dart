import 'package:digitalbank/helper/langue.dart';
import 'package:digitalbank/helper/local_storage.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('fr', 'FR'),
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(fontFamily: "poppins").copyWith(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: AppColors.mainColor,
              )),
      home: Splash(),
    );
  }
}
