import 'dart:convert';

import 'package:digitalbank/helper/local_storage.dart';
import 'package:digitalbank/models/cart_data.dart';
import 'package:digitalbank/models/carte_model.dart';
import 'package:digitalbank/urls/baseurl.dart';
import 'package:http/http.dart' as http;

class Service {
  static Future<dynamic> getservice() async {
    var url = Uri.parse("${BaseUrl}getauthcart");
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Authorization': "Bearer ${localstorage.token}"
    });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      // Cartes.amount = result['Cartes']['amount'];
      Cartes.code = result['Cartes']['code'];
      Cartes.id = result['Cartes']['id'];
      Cartes.created = result['Cartes']['created'];
      company = result['NameCompanye'];
      namecostumer = result['NameCostumer'];
      localstorage.setCarteCode(Cartes.code);

      // return Cartes;
    } else {
      throw Exception('fail to loader');
    }
  }
}
