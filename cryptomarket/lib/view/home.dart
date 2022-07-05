import 'package:cryptomarket/viewmodel/cubit/coin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/coin_model.dart';
import '../widgets/crypto_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coins"),
        centerTitle: true,
      ),
      body: BlocBuilder<CoinCubit, CoinState>(
        builder: (context, state) {
          List<Coin> coinList = BlocProvider.of<CoinCubit>(context).coins;
          return ListView.builder(
              itemCount: coinList.length,
              itemBuilder: (context, index) {
                return CryptoCard(
                    name: coinList[index].name,
                    symbol: coinList[index].symbol,
                    imageUrl: coinList[index].imageUrl,
                    price: coinList[index].price);
              });
        },
      ),
    );
  }
}
