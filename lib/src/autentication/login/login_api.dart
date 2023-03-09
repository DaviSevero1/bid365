import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String user, String password) async {
    var url = Uri.parse('https://bis365.com.br/bid365/api/v1/auth/login');
    var header = {
      "app": "ee85db5d-ebec-4548-a62b-ae8c68955d31",
      "Content-Type": "application/json"
    };

    Map params = {"username": user, "password": password};
    var _body = jsonEncode(params);

    var response = await http.post(url, headers: header, body: _body);

    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
