import 'package:cryptomarket/service/crypto_service.dart';
import 'package:cryptomarket/view/home_page.dart';
import 'package:cryptomarket/viewmodel/cubit/coin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitLogic extends StatefulWidget {
  const CubitLogic({Key? key}) : super(key: key);

  @override
  State<CubitLogic> createState() => _CubitLogicState();
}

class _CubitLogicState extends State<CubitLogic> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CoinCubit>(context).serviceInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinCubit, CoinState>(
      builder: (context, state) {
        if (state is CoinInitial) {
          return Home(
            service: CryptoService(),
          );
        } else if (state is CoinLoadedState) {
          return Home(service: CryptoService());
        }
        return Container(
          color: Colors.white,
        );
      },
    );
  }
}
