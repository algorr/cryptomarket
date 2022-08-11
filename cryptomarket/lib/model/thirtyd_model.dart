class Thirtyd {
  String volume;
  String priceChange;
  String priceChangePct;
  String volumeChange;
  String volumeChangePct;

  Thirtyd(
      {required this.volume,
      required this.priceChange,
      required this.priceChangePct,
      required this.volumeChange,
      required this.volumeChangePct});

  factory Thirtyd.fromJson(Map<String, dynamic> json) {
    return Thirtyd(
        volume: json['volume'],
        priceChange: json['price_change'],
        priceChangePct: json['price_change_pct'],
        volumeChange: json['volume_change'],
        volumeChangePct: json['volume_change_pct']);
  }
}
