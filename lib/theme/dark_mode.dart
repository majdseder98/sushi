import 'package:flutter/material.dart';

final ThemeData darkMode = ThemeData(
  // Define your dark theme properties here
  colorScheme: ColorScheme.dark(
    background: const Color.fromARGB(255, 20, 20, 20),
    primary: const Color.fromARGB(255, 122, 122, 122),
    secondary: const Color.fromARGB(255, 30, 30, 30),
    tertiary: const Color.fromARGB(255, 50, 50, 50),
    onPrimary: Colors.grey.shade300,
  ),
  // Add other theme properties if needed
);