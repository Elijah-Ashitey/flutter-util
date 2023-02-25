import 'package:flutter/material.dart';

import '../utils/constants.dart';

class Themes {
  final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    textTheme: ThemeData(brightness: Brightness.light).textTheme,
    // colorScheme: const ColorScheme.light(),
    //  ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    backgroundColor: Colors.white,
    primaryColorDark: Colors.black,
    highlightColor: const Color(0xffF4F5FB),
    shadowColor: Colors.grey.shade300,
    appBarTheme: const AppBarTheme(
      color: Constants.primaryColor,
      elevation: 0,
    ),
  );

  final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: const Color(0xFF26242e),
    cardColor: Colors.black,
    brightness: Brightness.dark,
    primaryColorDark: Colors.white,

    // colorScheme: const ColorScheme.dark(),
    // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    backgroundColor: const Color(0xFF26242e),
    highlightColor: Colors.white.withOpacity(0.1),
    shadowColor: Colors.black.withOpacity(0.25),

    textTheme: ThemeData(brightness: Brightness.dark).textTheme,
    appBarTheme: const AppBarTheme(
      color: Constants.primaryColor,
      elevation: 0,
    ),
  );
}
