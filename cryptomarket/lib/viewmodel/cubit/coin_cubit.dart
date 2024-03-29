import 'package:cryptomarket/model/coin_model.dart';
import 'package:cryptomarket/service/crypto_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coin_state.dart';

class CoinCubit extends Cubit<CoinState> {
  final CryptoService cryptoService;
  List<Coin> coins = [];
  bool isLoading = false;
  CoinCubit(this.cryptoService) : super(CoinInitial());

//Fetch All Coins From Api
  Future<List<Coin>?> fetchCoins() async {
    try {
      emit(CoinLoadingState());
      final coins = (await cryptoService.fetchData())!;
      if (coins.isNotEmpty) {
        emit(CoinLoadedState(coins));
      } else {
        emit(CoinErrorState());
      }
    } catch (e) {
      emit(CoinErrorState());
    }
    return null;
  }

  Future<List<Coin>?> refreshCoins() async {
    try {
      toogleLoading();
      Future.delayed(const Duration(seconds: 5));
      coins = (await cryptoService.fetchData())!;
      if (coins.isNotEmpty) {
        toogleLoading();
        return coins;
      } else {
        emit(CoinErrorState());
      }
    } catch (e) {
      emit(CoinErrorState());
      throw Exception();
    }
    return null;
  }

//For service initialize to CryptoInitial
  Future<void> serviceInit() async {
    cryptoService.streamCoins();
    await fetchCoins();
    emit(CoinInitial());
  }

  void toogleLoading() {
    isLoading = !isLoading;
  }
}
