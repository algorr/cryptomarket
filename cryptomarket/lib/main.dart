import 'package:cryptomarket/consts/home_consts.dart';
import 'package:cryptomarket/service/crypto_service.dart';
import 'package:cryptomarket/view/cubit_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'viewmodel/cubit/coin_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CryptoService(),
      child: MaterialApp(
        title: 'Coin Market',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.amber,
            primaryIconTheme: const IconThemeData(color: Colors.transparent),
            appBarTheme: AppBarTheme(
                color: HomeConsts.homeAppbarColor,
                titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
                actionsIconTheme: const IconThemeData(color: Colors.white))),
        home: BlocProvider(
          create: (context) => CoinCubit(
            RepositoryProvider.of<CryptoService>(context),
          ),
          child: const CubitLogic(),
        ),
      ),
    );
  }
}
