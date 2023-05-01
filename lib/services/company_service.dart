import 'dart:convert';
import 'dart:io';

import 'package:digitalbank/models/company/company.dart';
import 'package:digitalbank/pages/toas/toas.dart';
import 'package:digitalbank/urls/baseurl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  // static Future<bool> CreatCompay(
  //     Map<String, String> body, String filepath) async {
  //   String addimageUrl = "${BaseUrl}createcompany";
  //   Map<String, String> headers = {
  //     'Content-Type': 'multipart/form-data',
  //   };
  //   var request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
  //     ..fields.addAll(body)
  //     ..headers.addAll(headers)
  //     ..files.add(await http.MultipartFile.fromPath('img', filepath));
  //   var response = await request.send();
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  static CreatCompay(name, phone, adress, email, raison, description, password,
      quartier, File img) async {
    Dio dio = Dio();
    String fileName = img.path.split('/').last;
    FormData formData = FormData.fromMap({
      "name": name,
      "img": await MultipartFile.fromFile(img.path, filename: fileName),
      "phone": phone,
      "adress": adress,
      "email": email,
      "raison": raison,
      "description": description,
      "password": password,
      "quartier": quartier,
    });
      var response = await dio.post("${BaseUrl}createcompany", data: formData);
       
    try {
      if (response.statusCode == 200) {
        var result = response.data;

        if (result['status'] == true) {
          return true;
        } else {
          Toas.getSnackbarEror(
            appName,
             "Error vérifiez la taille de votre image (1 mo)",
          );
        }
      }
    } catch (e) {}
  }

  // static CreatCompay(Company company) async {
  //   var data = {
  //     "name": company.name.toString(),
  //     "img": company.img.toString(),
  //     "phone": company.phone.toString(),
  //     "adress": company.adress.toString(),
  //     "email": company.email.toString(),
  //     "raison": company.raison.toString(),
  //     "description": company.description,
  //     "password": company.password.toString(),
  //     "quartier": company.quartier.toString(),
  //   };
  //   print(data);
  //   var url = Uri.parse("${BaseUrl}createcompany");
  //   final response = await http.post(
  //     url,
  //     body: data,
  //   );
  //   if (response.statusCode == 200) {
  //     var result = jsonDecode(response.body);
  //     if (result['status'] == true) {
  //       Toas.getSnackbarsucess(appName, result['message']);
  //       return true;
  //     } else {
  //       Toas.getSnackbarEror(appName, result['message']);
  //     }
  //   } else {
  //     throw Exception('fail to loader');
  //   }
  // }
}
