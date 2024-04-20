import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme:  ColorScheme.dark(
    background: Colors.black,
    primary: Colors.white,
    secondary: Colors.grey.shade800,
    tertiary: Colors.black,
  ),
  useMaterial3: true,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.black,
  brightness: Brightness.dark,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.black),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.black.withOpacity(0.6),
  ),
  cardTheme: const CardTheme(
    color: Colors.black,
    margin: EdgeInsets.all(0),
  ),
  cardColor: Colors.black,
  dialogBackgroundColor: Colors.black.withOpacity(0.6),
  dividerColor: Colors.white,
  disabledColor: Colors.black,
  sliderTheme: SliderThemeData(
    thumbShape: SliderComponentShape.noThumb,
    minThumbSeparation: 0,
  ),
  appBarTheme: const AppBarTheme(iconTheme: const IconThemeData(color: Colors.white),),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 45, color: Colors.white, fontWeight: FontWeight.w600),
    displayMedium: TextStyle(fontSize: 42, color: Colors.white, fontWeight: FontWeight.w600),
    labelSmall: TextStyle(color: Colors.white, fontSize: 11),
    bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
    bodySmall: TextStyle(color: Colors.white, fontSize: 12),
    bodyLarge: TextStyle(fontSize: 30, color: Colors.white),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
);
