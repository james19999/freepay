import 'dart:convert';

import 'package:digitalbank/helper/local_storage.dart';
import 'package:digitalbank/models/cart_data.dart';
import 'package:digitalbank/models/carte_model.dart';
import 'package:digitalbank/models/transaction.dart';
import 'package:digitalbank/pages/toas/toas.dart';
import 'package:digitalbank/services/carte_service.dart';
import 'package:digitalbank/services/company_service.dart';
import 'package:digitalbank/services/transaction_service.dart';
import 'package:digitalbank/urls/baseurl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class GlobalControllerNotify extends ChangeNotifier {
  var cancelde;
  var pading;
  var success;

  List<Transaction> table = [];
  List<dynamic> companies = [];
  GlobalControllerNotify() {
    getservice();
    getcarttransaction();
    getallcompany();
  }

  // ignore: non_constant_identifier_names

  getallcompany() async {
    companies = await CompanyService.getCompay();
    notifyListeners();
  }

  getservice() async {
    await Service.getservice();

    notifyListeners();
  }

  getcarttransaction() async {
    table = await TransactionService.getcarttransactions();
    try {
      cancelde = table.where((e) => e.status == 'cancelled');
      // ignore: empty_catches
    } catch (e) {}
    try {
      pading = table.where((e) => e.status == 'pending');
      // ignore: empty_catches
    } catch (e) {}
    try {
      success = table.where((e) => e.status == 'success');
      // ignore: empty_catches
    } catch (e) {}
    notifyListeners();
  }

  canceledtransaction(code) async {
    var url = Uri.parse("${BaseUrl}cancel/transaction/$code");
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Authorization': "Bearer ${localstorage.token}"
    });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      if (result['status'] == true) {
        Toas.getSnackbarsucess("App name", result['message']);
        notifyListeners();
      } else {
        Toas.getSnackbarEror("App Name", result['message']);
      }
    } else {
      throw Exception('fail to loader');
    }
  }
}

final GlobalProviders = ChangeNotifierProvider<GlobalControllerNotify>(
  (ref) {
    return GlobalControllerNotify();
  },
);
