import 'package:cryptomarket/service/crypto_service.dart';
import 'package:cryptomarket/view/cubit_logic.dart';
import 'package:cryptomarket/viewmodel/cubit/coin_cubit.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinCubit, CoinState>(
      builder: (context, state) {
        return const Scaffold(
          body: CustomSplashScreen(),
        );
      },
    );
  }
}

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/images/logo.png',
        width: SplashScreenConsts.imageWidth,
        height: SplashScreenConsts.imageHeight,
      ),
      loaderColor: Colors.red.shade800,
      logoWidth: SplashScreenConsts.logoWidth,
      title: const Text(
        SplashScreenConsts.title,
        style: SplashScreenConsts.titleStyle,
      ),
      backgroundColor: Colors.black38,
      showLoader: false,
      loadingText: const Text(SplashScreenConsts.loadingTitle),
      navigator:  BlocProvider(
        create: (context) => CoinCubit(RepositoryProvider.of<CryptoService>(context)),
        child: const CubitLogic(),
      ),
      durationInSeconds: 5,
    );
  }
}

class SplashScreenConsts {
  static const String title = 'New Crypto Market';
  static const String loadingTitle = 'Please Wait..';
  static const TextStyle titleStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
  static const double logoWidth = 250;
  static const double imageWidth = 200;
  static const double imageHeight = 200;
}
