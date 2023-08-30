import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
      // scaffoldBackgroundColor: CustomColors.grayF5F5F5,

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
      )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: CustomColors.mainColor,
          selectedIconTheme: IconThemeData(color: CustomColors.mainColor),
          unselectedIconTheme: const IconThemeData(color: Colors.black38)),
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFF040404),
      dividerColor: Colors.white54,
      splashColor: Colors.black.withOpacity(0.0),
      iconTheme: const IconThemeData(color: Colors.white),
      primaryIconTheme: const IconThemeData(color: Colors.black87));

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Sarabun-Medium',
        ),
    primaryTextTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Sarabun-Medium',
        ),
    appBarTheme: AppBarTheme(
      backgroundColor: CustomColors.scaffoldDarkBack,
      titleTextStyle:
          const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark, statusBarColor: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.black),
    )),
    scaffoldBackgroundColor: Colors.black,
    splashColor: Colors.black.withOpacity(0.0),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: CustomColors.bottomDarkBack,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey.shade700,
      selectedIconTheme: const IconThemeData(color: Colors.white),
      unselectedIconTheme: const IconThemeData(color: Colors.white),
    ),
    primaryColor: Colors.black,
    dividerColor: Colors.white54,
    iconTheme: const IconThemeData(color: Colors.white),
    primaryIconTheme: const IconThemeData(color: Colors.black87),
  );
}
