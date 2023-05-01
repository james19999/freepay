import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class localstorage {
  static String? lang = 'fr';

  localstorage();
  static final storage = GetStorage();

  // static bool mylangue=false;

  static get username => storage.read("username") ?? '';
  static get token => storage.read("token");

  static get deletetoken => storage.remove("token");
  static get deletename => storage.remove("username");
  static get cartecode => storage.read("cartecode");
  static get cartecodedelete => storage.remove("cartecode");

  static get setlangue => storage.read("setlangue");

  static get mylangues => storage.read("mylangue");

  static changemylangue (bool mylangue) async {
    storage.write("mylangue", mylangue);

  }
  
    // changer la langue de l'appli
  static locallangue(String loc) {
    var local = Locale(loc, '');
    Get.updateLocale(local);
    lang = loc;
    storage.write('setlangue', loc);
  }

   static setAppLang() {
    var appLang = storage.read('setlangue') ?? 'en';
    var local = Locale(appLang, '');
    Get.updateLocale(local);
  }



  static setCarteCode(code) async {
    storage.write("cartecode", code);
  }

  static costumerinfo({username, token}) async {
    storage.write("username", username);
    storage.write("token", token);
  }
}
