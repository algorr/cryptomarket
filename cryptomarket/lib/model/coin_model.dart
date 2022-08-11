import 'package:cryptomarket/model/oned_model.dart';
import 'package:cryptomarket/model/thirtyd_model.dart';

class Coin {
  final String name;
  final String symbol;
  final String imageUrl;
  final double price;
  final Oned oned;
  final Thirtyd thiryd;

  Coin({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.oned,
    required this.thiryd,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      imageUrl: json['logo_url'],
      name: json['currency'],
      price: double.parse(json['price']),
      symbol: json['symbol'],
      oned: Oned.fromJson(json['1d']),
      thiryd: Thirtyd.fromJson(json['30d']),
    );
  }
}

List<Coin> coinList = [];
