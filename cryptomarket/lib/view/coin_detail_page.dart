import 'package:cryptomarket/model/coin_model.dart';
import 'package:cryptomarket/service/crypto_service.dart';
import 'package:cryptomarket/viewmodel/cubit/coin_cubit.dart';
import 'package:cryptomarket/widgets/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CoinDetailPage extends StatelessWidget {
  final Coin coin;
  const CoinDetailPage({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSvg = coin.imageUrl.endsWith('.svg');
    return BlocProvider(
      create: (context) => CoinCubit(CryptoService()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(coin.name),
          centerTitle: true,
        ),
        body: BlocBuilder<CoinCubit, CoinState>(
          builder: (context, state) {
            return Column(
              children: [
                CryptoCard(
                  name: coin.name,
                  symbol: coin.symbol,
                  imageUrl: coin.imageUrl,
                  price: coin.price,
                  icon: double.parse(coin.oned.priceChange).isNegative
                      ? const Icon(
                          Icons.arrow_circle_down_rounded,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.arrow_circle_up_rounded,
                          color: Colors.green,
                        ),
                  priceChange: double.parse(coin.oned.priceChange),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
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
                      child: isSvg
                          ? SvgPicture.network(coin.imageUrl)
                          : Image.network(coin.imageUrl),
                    ),
                  ),
                ),
                
              ],
            );
          },
        ),
      ),
    );
  }
}
