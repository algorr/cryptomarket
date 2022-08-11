import 'package:cryptomarket/consts/crypto_card_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    Key? key,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.priceChange,
    required this.icon
  }) : super(key: key);

  final String name;
  final String symbol;
  final String imageUrl;
  final double price;
  final double priceChange;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final svg = imageUrl.endsWith('.svg');
    return Padding(
      padding: CryptoCardConsts.cardPadding,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: CryptoCardConsts.cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(4, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: CryptoCardConsts.cardColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(4, 4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: svg
                      ? SvgPicture.network(imageUrl)
                      : Image.network(imageUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      name,
                      style: TextStyle(
                        color: CryptoCardConsts.cardTextColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    symbol,
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: CryptoCardConsts.cardPriceColumnPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price.toDouble().toString(),
                    style: TextStyle(
                      color: CryptoCardConsts.cardTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(children: [
                    icon,
                    Text(
                    priceChange.toDouble().toString(),
                    style: TextStyle(
                      color: CryptoCardConsts.cardTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ],)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
