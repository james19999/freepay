import 'dart:convert';

import 'package:digitalbank/helper/local_storage.dart';

import 'package:digitalbank/urls/baseurl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class TransactionController extends ChangeNotifier {
  var result;
  TransactionController() {
    // getcarttransactions();
    // Service.getservice();
    print("transaction controller");
  }
  getcarttransactions() async {
    var url =
        Uri.parse("${BaseUrl}getauthcarttransaction/${localstorage.cartecode}");
    print(url);
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Authorization': "Bearer ${localstorage.token}"
    });
    if (response.statusCode == 200) {
      result = jsonDecode(response.body)['transaction'];
      print(result);
      notifyListeners();
    } else {
      throw Exception('fail to loader');
    }
  }
}

final Transaction = ChangeNotifierProvider<TransactionController>(
  (ref) {
    return TransactionController();
  },
);
