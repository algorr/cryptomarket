import 'package:cryptomarket/view/home.dart';
import 'package:cryptomarket/viewmodel/cubit/coin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

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
          return const Home();
        }
        if (state is CoinLoadingState) {
          return Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade100,
              child: const Home());
        }

        if (state is CoinLoadedState) {
          return const Home();
        }
        return Container(
          color: Colors.red,
        );
      },
    );
  }
}
