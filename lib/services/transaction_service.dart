import 'dart:convert';

import 'package:digitalbank/helper/local_storage.dart';
import 'package:digitalbank/models/transaction.dart';
import 'package:digitalbank/urls/baseurl.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  //getauthcarttransaction by today
  static Future<dynamic> getcarttransactions() async {
    var url =
        Uri.parse("${BaseUrl}getauthcarttransaction/${localstorage.cartecode}");
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Authorization': "Bearer ${localstorage.token}"
    });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['transaction'];
      return List<Transaction>.from(
          result.map((Servi) => Transaction.fromJson(Servi)));
    } else {
      throw Exception('fail to loader');
    }
  }

// get all transactions by created_at
  static Future<dynamic> getalltransaction() async {
    var url =
        Uri.parse("${BaseUrl}getalltransaction/${localstorage.cartecode}");
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Authorization': "Bearer ${localstorage.token}"
    });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['transaction'];
      return List<Transaction>.from(
          result.map((Servi) => Transaction.fromJson(Servi)));
    } else {
      throw Exception('fail to loader');
    }
  }

// get all transactions by gettransactionoffweek
  static Future<dynamic> gettransactionoffweek() async {
    var url =
        Uri.parse("${BaseUrl}gettransactionoffweek/${localstorage.cartecode}");
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Authorization': "Bearer ${localstorage.token}"
    });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['transaction'];
      return List<Transaction>.from(
          result.map((Servi) => Transaction.fromJson(Servi)));
    } else {
      throw Exception('fail to loader');
    }
  }

// get all transactions by gettransactionoffmonth
  static Future<dynamic> gettransactionoffmonth() async {
    var url =
        Uri.parse("${BaseUrl}gettransactionoffmonth/${localstorage.cartecode}");
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Authorization': "Bearer ${localstorage.token}"
    });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)['transaction'];
      return List<Transaction>.from(
          result.map((Servi) => Transaction.fromJson(Servi)));
    } else {
      throw Exception('fail to loader');
    }
  }
}
