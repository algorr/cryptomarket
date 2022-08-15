import 'dart:convert';
import 'package:cryptomarket/api_key.dart';
import 'package:cryptomarket/model/coin_model.dart';
import 'package:http/http.dart' as http;

class CryptoService {
  //fetch data from api
  Future<List<Coin>?> fetchData() async {
    String baseUrl =
        "https://api.nomics.com/v1/currencies/ticker?key=$apiKey&interval=1d,30d&convert=EUR&platform-currency=ETH&per-page=100&page=1";

    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = json.decode(response.body) as List;
        var coinList = body.map((e) => Coin.fromJson(e)).toList();
        return coinList;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  // stream fetched data from api
  Stream<List<Coin>?> streamCoins() =>
      Stream.periodic(const Duration(seconds: 3)).asyncMap((_) => fetchData());
}
