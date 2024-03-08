import 'package:flutter/material.dart';

class ThemeClass {
  Color whiteBackgroundColor = Colors.white;
  Color blackBackgroundColor = const Color.fromARGB(255, 42, 42, 42);

  Color chatBackgroundColor = const Color(0xff584CD6);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _themeClass.whiteBackgroundColor,
    textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.red, fontSize: 40)),
    primaryColor: _themeClass.chatBackgroundColor,
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _themeClass.blackBackgroundColor,
    primaryColor: _themeClass.chatBackgroundColor,
  );
}

ThemeClass _themeClass = ThemeClass();
