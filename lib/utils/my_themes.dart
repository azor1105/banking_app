import 'package:banking_app/utils/my_colors.dart';
import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    useMaterial3: true,
    primaryColorLight: MyColors.c1C1C1E,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MyColors.c1C1C1E,
      type: BottomNavigationBarType.fixed,
    ),
    scaffoldBackgroundColor: MyColors.black,
    colorScheme: const ColorScheme.dark(),
    hintColor: MyColors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(MyColors.c1C1C1E),
        foregroundColor: MaterialStateProperty.all<Color>(MyColors.white),
      ),
    ),
    primaryColor: MyColors.c1C1C1E,
  );

  static final lightTheme = ThemeData(
    useMaterial3: true,
    primaryColorLight: MyColors.c8E8E93,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyColors.white,
    ),
    primaryColor: MyColors.white,
    hintColor: MyColors.black,
    scaffoldBackgroundColor: MyColors.cF5F5F5,
    colorScheme: const ColorScheme.light(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(MyColors.white),
        foregroundColor: MaterialStateProperty.all<Color>(MyColors.black),
      ),
    ),
  );
}
