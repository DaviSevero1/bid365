import 'package:http/http.dart' as http;

class Leilao_api {
  Future<bool> getAll() async {
    var url = Uri.parse('https://bis365.com.br/bid365/api/v1/auctions');
    var header = {
      "app": "ee85db5d-ebec-4548-a62b-ae8c68955d31",
      "Content-Type": "application/json"
    };

    var response = await http.get(url, headers: header);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    } else {
      print('Erro ao buscar leilões');
    }
    return false;
  }

  // final data =  login();
}
