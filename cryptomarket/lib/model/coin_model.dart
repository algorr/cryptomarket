class Coin {
  final String name;
  final String symbol;
  final String imageUrl;
  final double price;

  Coin({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      imageUrl: json['logo_url'],
      name: json['currency'],
      price: double.parse(json['price']),
      symbol: json['symbol'],
    );
  }
}

List<Coin> coinList = [];
