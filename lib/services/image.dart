import 'package:digitalbank/pages/toas/toas.dart';
import 'package:digitalbank/urls/baseurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServiceImage {
  // Future<bool> addImage(Map<String, String> body, String filepath) async {
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
  //     print(response);
  //     Toas.getSnackbarsucess(appName, "Compte créer");
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
