import 'package:flutter/material.dart';

// Light Mode Theme
ThemeData lightMode = ThemeData(
  drawerTheme: const DrawerThemeData(

  ),
  colorScheme:  ColorScheme.light(
    background: Colors.white,
    primary: Colors.black,
    secondary: Colors.grey.shade300,
    tertiary: Colors.white,
  ),
  useMaterial3: true,
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.white),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.white.withOpacity(0.6),
  ),
  cardTheme: const CardTheme(
    color: Colors.white,
    margin: EdgeInsets.all(0),
  ),
  cardColor: Colors.white,
  dialogBackgroundColor: Colors.white.withOpacity(0.6),
  dividerColor: Colors.black,
  disabledColor: Colors.white,
  sliderTheme: SliderThemeData(
    thumbShape: SliderComponentShape.noThumb,
    minThumbSeparation: 0,
  ),
  appBarTheme: const AppBarTheme(
   iconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 45, color: Colors.black, fontWeight: FontWeight.w600),
    displayMedium: TextStyle(fontSize: 42, color: Colors.black, fontWeight: FontWeight.w600),
    labelSmall: TextStyle(color: Colors.black, fontSize: 11),
    bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
    bodySmall: TextStyle(color: Colors.black, fontSize: 12),
    bodyLarge: TextStyle(fontSize: 30, color: Colors.black),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
);


