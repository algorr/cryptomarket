part of 'coin_cubit.dart';

abstract class CoinState {}

class CoinInitial extends CoinState {}

class CoinLoadingState extends CoinState {}

class CoinLoadedState extends CoinState {}

class CoinErrorState extends CoinState {}

class CoinRefreshStartState extends CoinState {}

class CoinRefreshEndState extends CoinState {}
