import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
   surface :  Color.fromARGB(255, 37, 44, 51),
    primary:  Color.fromARGB(255, 37, 44, 51),
    secondary:Color.fromARGB(255, 220, 220, 220),
    tertiary: Color.fromARGB(255, 255, 94, 58),
    
  ),
);
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
   surface :  Color.fromARGB(255, 220, 220, 220),
    primary:  Color.fromARGB(255, 220, 220, 220),
    secondary:Color.fromARGB(255, 37, 44, 51),
    tertiary: Color.fromARGB(255, 255, 94, 58),
    
  ),
);