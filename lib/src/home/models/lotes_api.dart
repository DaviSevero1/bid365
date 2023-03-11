import 'dart:convert';
import 'package:bid365/src/home/models/model_lotes.dart';
import 'package:http/http.dart' as http;

class Lotes_api {
  Future<List<ModelLotes>> getAllLotes() async {
    var url = Uri.parse('https://bis365.com.br/bid365/api/v1/lots');
    var header = {
      "app": "ee85db5d-ebec-4548-a62b-ae8c68955d31",
      "Content-Type": "application/json"
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      print('Response status: ${response.statusCode}');

      var data = jsonDecode(response.body);
      print(data);

      return data['data'].map<ModelLotes>((p) => ModelLotes.fromMap(p)).toList();
      
    } else {
      throw Exception('Falha ao buscar lotes');
    }
  }
}
