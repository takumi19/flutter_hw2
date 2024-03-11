import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  fontFamily: "Lato",
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  canvasColor: Colors.black,
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF212121),
    brightness: Brightness.dark,
  ),
  dividerColor: Colors.black54,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(color: Colors.white),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.grey,
    unselectedItemColor: Colors.white,
  ),
);

final ThemeData lightTheme = ThemeData(
  fontFamily: "Lato",
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  canvasColor: Colors.white,
  colorScheme: const ColorScheme.light(
    background: Color(0xFFE5E5E5),
    brightness: Brightness.light,
  ),
  dividerColor: const Color(0xFF757575),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black, foregroundColor: Colors.white),
  textTheme: const TextTheme(
    titleMedium: TextStyle(color: Colors.black),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.grey,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.white,
  ),
);
