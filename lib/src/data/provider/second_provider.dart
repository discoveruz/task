import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:task/src/data/model/books_model.dart';
import 'package:task/src/data/model/pupils_model.dart';

class SecondApi {
  static Future getBookStoredata() async {
    try {
      final response =
          await http.get(Uri.parse("https://jsonkeeper.com/b/LDPQ"));
      if (response.statusCode == 200) {
        return BookStore.fromJson(response.body);
      } else {
        return  ErorrModel('Something went wrong');
      }
    } on SocketException {
      return  ErorrModel("No Internet Connection");
    } catch (e) {
      return  ErorrModel('Something went wrong');
    }
  }
}
