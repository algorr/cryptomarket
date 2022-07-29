import 'dart:convert';
import 'package:cryptomarket/api_key.dart';
import 'package:cryptomarket/model/coin_model.dart';
import 'package:http/http.dart' as http;

class CryptoService {

  //fetch data from api
  Future<List<Coin>?> fetchData() async {
    try {
      String url =
          "https://api.nomics.com/v1/currencies/ticker?key=$apiKey&interval=1d,30d&convert=EUR&platform-currency=ETH&per-page=100&page=1";
      final response = await http.get(Uri.parse(url));
      print("Response : ${response.body}");
      if (response.statusCode == 200) {
        var body = json.decode(response.body) as List;

        var coinList = body.map((e) => Coin.fromJson(e)).toList();

        return coinList;
      } else {
        //print("hata");
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }
  // stream fetched data from api
  Stream<List<Coin>?> streamCoins() =>
      Stream.periodic(const Duration(seconds: 3)).asyncMap((_) => fetchData());
}
