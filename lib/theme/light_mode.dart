import 'package:flutter/material.dart';

final ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade100,
    tertiary: Colors.white,
    // Note: 'inversePrimary' is not a valid property for 'ColorScheme.light'
  ),
  // Define other theme properties if needed
  // Example of defining a custom property:
  // primaryColor: Colors.grey.shade700,
);

