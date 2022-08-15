import 'package:cryptomarket/service/crypto_service.dart';
import 'package:cryptomarket/theme/light_theme.dart';
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
        theme: LightTheme().themeData,
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
