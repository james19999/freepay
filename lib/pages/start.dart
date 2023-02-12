import 'package:digitalbank/helper/images.dart';
import 'package:digitalbank/pages/colors/color.dart';
import 'package:digitalbank/pages/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: Get.height * 0.6,
          width: Get.width,
          child: Image.asset(""),
        ),
        Text(
          "Bienvenue sur ....",
          style: StyleText,
        ),
        SizedBox(height: Get.height * 0.02),
        Text(
          "Bienvenue sur ....",
        ),
        SizedBox(
          height: Get.height * 0.1,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: Get.height * 0.07,
                color: AppColors.mainColor,
                width: Get.width * 0.5,
                child: Text('Start'),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
