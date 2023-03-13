import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisteApi {
  static Future<bool> register(String user, String password, String name, String phone) async {
    var url = Uri.parse('https://bis365.com.br/bid365/api/v1/auth/users');
    var header = {      
      "app": "ee85db5d-ebec-4548-a62b-ae8c68955d31",
      "Content-Type": "application/json"
    };

    Map params = {"email": user, "password": password, "name" : name, "phone": phone};
    var _body = jsonEncode(params);             

    var response = await http.post(url, headers: header, body: _body);

   
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
