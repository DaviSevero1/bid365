import 'dart:convert';

import 'package:bid365/src/home/leiloes_api/model_leiloes.dart';
import 'package:http/http.dart' as http;

class Leilao_api {
  Future<List<ModelLeiloes>> getAll() async {
    var url = Uri.parse('https://bis365.com.br/bid365/api/v1/auctions');
    var header = {
      "app": "ee85db5d-ebec-4548-a62b-ae8c68955d31",
      "Content-Type": "application/json"
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return data['data']
          .map<ModelLeiloes>((p) => ModelLeiloes.fromMap(p))
          .toList();
    } else {
      throw Exception('Falha ao buscar leilões');
    }
  }
}
