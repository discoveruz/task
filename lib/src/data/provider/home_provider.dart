import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:task/src/data/model/pupils_model.dart';

class HomeApi {
  static Future getStudents() async {
    try {
      final response =
          await http.get(Uri.parse("https://jsonkeeper.com/b/AJ2X"));
      if (response.statusCode == 200) {
        return Pupils.fromJson(response.body);
      } else {
        return ErorrModel('Something went wrong');
      }
    } on SocketException {
      return ErorrModel("No Internet Connection");
    } catch (e) {
      return ErorrModel('Something went wrong');
    }
  }
}
