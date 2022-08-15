import 'package:flutter/material.dart';

import '../consts/home_consts.dart';

class LightTheme {
  ThemeData themeData =
      ThemeData(
        primarySwatch: Colors.amber,
          primaryIconTheme: const IconThemeData(color: Colors.transparent),
          appBarTheme: AppBarTheme(
              color: HomeConsts.homeAppbarColor,
              titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
              actionsIconTheme: const IconThemeData(color: Colors.white)));
      
}
