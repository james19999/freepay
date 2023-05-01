import 'dart:convert';

import 'package:digitalbank/helper/local_storage.dart';
import 'package:digitalbank/urls/baseurl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class UserCostumerController extends ChangeNotifier {
  UserCostumerController() {}

  // ignore: non_constant_identifier_names
  AuthConstumer(email, identify) async {
    var data = {
      "email": email,
      "identify": identify,
    };
    var url = Uri.parse("${BaseUrl}login/costumer");
    final response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      if (result['status'] == true) {
        localstorage.costumerinfo(
            username: result['name'], token: result['token']);

        return true;
      } else {
        return false;
      }
    }
  }

  LogoutUser() async {
    var url = Uri.parse("${BaseUrl}logout/user");
    final response = await http
        .post(url,  headers: {"Authorization": "Bearer ${localstorage.token}"});

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      if (result['status'] == true) {
        localstorage.deletetoken;
        localstorage.deletename;
        return true;
      }
    }
  }
  
  UpadateIdentify(identify) async {
    var url = Uri.parse("${BaseUrl}Update/Costumer/Idenfify");
      var data = {
      "identify": identify,
    };
    final response = await http
        .post(url, body: data, headers: {"Authorization": "Bearer ${localstorage.token}"});

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      if (result['status'] == true) {
        return true;
      }
    }
  }
}

final AuthProviders = ChangeNotifierProvider<UserCostumerController>(
  (ref) {
    return UserCostumerController();
  },
);
