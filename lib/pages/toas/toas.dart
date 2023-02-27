import 'package:digitalbank/pages/styles/style.dart';
import 'package:digitalbank/urls/baseurl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Toas {
  static getSnackbarsucess(String title, String text) {
    return Get.snackbar(
      title,
      text,
      icon: Icon(Icons.check_circle_outlined, color: Colors.white),
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackStyle: SnackStyle.FLOATING,
      borderRadius: 4,
      snackPosition: SnackPosition.BOTTOM,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(10.0),
    );
  }

  static getSnackbarEror(String title, String text) {
    return Get.snackbar(
      title,
      text,
      icon: Icon(Icons.cancel_rounded, color: Colors.white),
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackStyle: SnackStyle.FLOATING,
      borderRadius: 4,
      snackPosition: SnackPosition.TOP,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(10.0),
    );
  }

  static message(BuildContext? context, message) {
    return showDialog<bool>(
      context: context!,
      builder: (context) {
        return AlertDialog(
          title: Text(
            message,
            style: StyleText.copyWith(fontSize: fontsizes),
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(
                'ok',
                style: StyleText,
              ),
            ),
          ],
        );
      },
    );
  }
}
