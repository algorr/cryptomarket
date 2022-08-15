import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({Key? key, this.color}) : super(key: key);

  final Color? color;
  final _defaultColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return SpinKitChasingDots(
      color: color ?? _defaultColor,
    );
  }
}
