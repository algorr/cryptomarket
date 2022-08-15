import 'package:cryptomarket/consts/home_consts.dart';
import 'package:cryptomarket/packages/loading_bar.dart';
import 'package:cryptomarket/service/crypto_service.dart';
import 'package:cryptomarket/viewmodel/cubit/coin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/crypto_card.dart';
import 'coin_detail_page.dart';

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
        actions: const [RefreshButton()],
      ),
      body: BlocBuilder<CoinCubit, CoinState>(
        builder: (context, state) {
          return StreamBuilder<dynamic>(
              stream: service.streamCoins(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(
                      child: LoadingBar(),
                    );
                  default:
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CoinDetailPage(
                                          coin: snapshot.data[index],
                                        )));
                              },
                              child: CryptoCard(
                                name: snapshot.data[index].name!,
                                symbol: snapshot.data[index].symbol!,
                                imageUrl: snapshot.data[index].imageUrl!,
                                price: snapshot.data[index].price!,
                                priceChange: double.parse(
                                    snapshot.data[index].oned.priceChange),
                                icon: double.parse((snapshot
                                                .data[index].oned.priceChange))
                                            .roundToDouble() <
                                        (0)
                                    ? const Icon(
                                        Icons.arrow_circle_down_rounded,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.arrow_circle_up_rounded,
                                        color: Colors.green,
                                      ),
                              ),
                            );
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

class RefreshButton extends StatelessWidget {
  const RefreshButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          BlocProvider.of<CoinCubit>(context).refreshCoins();
        },
        child: const Icon(Icons.refresh_rounded));
  }
}
