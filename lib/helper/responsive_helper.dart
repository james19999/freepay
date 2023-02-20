import 'package:flutter/material.dart';

class ResponsiveHelper {
  // sur mobile
  static bool isMobile(context) {
    final size = MediaQuery.of(context).size.width;
    if (size < 650) {
      return true;
    } else {
      return false;
    }
  }

  // sur une tablette
  static bool isTab(context) {
    final size = MediaQuery.of(context).size.width;
    if (size < 1300 && size >= 650) {
      return true;
    } else {
      return false;
    }
  }

  // mode paysage
  static bool isLandscape(context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return true;
    } else {
      return false;
    }
  }
}
