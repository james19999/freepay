import 'dart:convert';

import 'package:digitalbank/models/company.dart';
import 'package:digitalbank/pages/toas/toas.dart';
import 'package:digitalbank/urls/baseurl.dart';
import 'package:http/http.dart' as http;

class CompanyService {
  static Future<List<Company>> getCompay() async {
    var url = Uri.parse("${BaseUrl}getcompany");
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
    });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return List<Company>.from(
          result.map((company) => Company.fromJson(company)));
    } else {
      throw Exception('fail to loader');
    }
  }

  static CreatCompay(Company company) async {
    var data = {
      "name": company.name,
      "phone": company.phone,
      "adress": company.adress,
      "email": company.email,
      "raison": company.raison,
      "domaine ": company.domaine,
      "password": company.password,
      "quartier": company.quartier,
    };
    var url = Uri.parse("${BaseUrl}createcompany");
    final response = await http.post(
      url,
      headers: {
        'content-type': 'application/json',
      },
      body: data,
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      if (result['status'] == true) {
        Toas.getSnackbarsucess(appName, result['message']);
      } else {
        Toas.getSnackbarEror(appName, result['message']);
      }
    } else {
      throw Exception('fail to loader');
    }
  }
}
