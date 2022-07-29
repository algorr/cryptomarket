import 'package:cryptomarket/consts/home_consts.dart';
import 'package:cryptomarket/service/crypto_service.dart';
import 'package:cryptomarket/viewmodel/cubit/coin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/crypto_card.dart';

class Home extends StatelessWidget {
  final CryptoService service;
  const Home({Key? key, required this.service}) : super(key: key);

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
          // List<Coin> coinList = BlocProvider.of<CoinCubit>(context).coins;
          //bool isLoading = BlocProvider.of<CoinCubit>(context).isLoading;
          // print("ISLOADING : $isLoading");
          return StreamBuilder<dynamic>(
              stream: service.streamCoins(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return CryptoCard(
                                name: snapshot.data[index].name!,
                                symbol: snapshot.data[index].symbol!,
                                imageUrl: snapshot.data[index].imageUrl!,
                                price: snapshot.data[index].price!);
                          });
                    } else {
                      return const Center(
                        child: Text("Something is wrong"),
                      );
                    }
                }
              });
        },
      ),
    );
  }
}
