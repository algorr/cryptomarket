import 'package:cryptomarket/consts/home_consts.dart';
import 'package:cryptomarket/viewmodel/cubit/coin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../model/coin_model.dart';
import '../widgets/crypto_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeConsts.homeScaffoldColor,
      appBar: AppBar(
        title: Text(HomeConsts.appbarTitle),
        centerTitle: true,
        actions: [
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<CoinCubit>(context).refreshCoins();
              },
              child: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: BlocBuilder<CoinCubit, CoinState>(
        builder: (context, state) {
          List<Coin> coinList = BlocProvider.of<CoinCubit>(context).coins;
          bool isLoading = BlocProvider.of<CoinCubit>(context).isLoading;
          print("ISLOADING : $isLoading");
          return isLoading == false
              ? ListView.builder(
                  itemCount: coinList.length,
                  itemBuilder: (context, index) {
                    return CryptoCard(
                        name: coinList[index].name,
                        symbol: coinList[index].symbol,
                        imageUrl: coinList[index].imageUrl,
                        price: coinList[index].price);
                  })
              : Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
