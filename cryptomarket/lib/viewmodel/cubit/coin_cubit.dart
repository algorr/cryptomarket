import 'package:cryptomarket/model/coin_model.dart';
import 'package:cryptomarket/service/crypto_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coin_state.dart';

class CoinCubit extends Cubit<CoinState> {
  final CryptoService cryptoService;
  List<Coin> coins = [];
  bool isLoading = false;
  CoinCubit(this.cryptoService) : super(CoinInitial());

  Future<List<Coin>?> fetchCoins() async {
    try {
      emit(CoinLoadingState());
      coins = (await cryptoService.fetchData())!;
      if (coins.isNotEmpty) {
        emit(CoinLoadedState());
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

  Future<List<Coin>?> refreshCoins() async {
    try {
      toogleLoading();
      print(isLoading);
      Future.delayed(const Duration(seconds: 5));
      coins = (await cryptoService.fetchData())!;
      if (coins.isNotEmpty) {
        toogleLoading();
        print(isLoading);
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

  Future<void> serviceInit() async {
    await cryptoService.fetchData();
    await fetchCoins();
    emit(CoinInitial());
  }

  void toogleLoading() {
    isLoading = !isLoading;
  }
}
