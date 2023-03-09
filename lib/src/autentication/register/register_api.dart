import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisteApi {
  static Future<bool> register(String user, String password, String name, String phone) async {
    var url = Uri.parse('https://bis365.com.br/bid365/api/v1/auth/users');
    var header = {      
      "app": "ee85db5d-ebec-4548-a62b-ae8c68955d31",
      "Content-Type": "application/json"
    };

    Map params = {"email": user, "password": password, "name" : name, "phone": phone};// Ao logar com a api usamos a chave "username",
    var _body = jsonEncode(params);                                                   // e para criar estamos passando "email", por que disso?

    var response = await http.post(url, headers: header, body: _body);

    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    if (response.statusCode == 200) { //Obs: O status de resposta, geralmente, deveria voltar como 201, pois ele retorna Ok + novo recurso 
      return true;
    }
    return false;
  }
}
