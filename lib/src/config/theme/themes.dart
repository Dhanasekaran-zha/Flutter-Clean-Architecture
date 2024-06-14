import 'package:flutter/material.dart';
import 'package:flutter_pokedex/src/constants/app_fonts.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppFontFamily.MONTSERRAT,
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 100,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: AppFontFamily.MONTSERRAT,
        fontSize: AppFontSize.XXL,
        fontWeight: AppFontWeight.SEMI_BOLD),
  );
}
