import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: Colors.blue.withOpacity(0.3),
    selectionHandleColor: Colors.blue,            
    cursorColor: Colors.blue,                  
  ),
   
  
  colorScheme: const ColorScheme.dark(
    surface :  Color.fromARGB(255, 37, 44, 51),
    primary:  Color.fromARGB(255, 37, 44, 51),
    secondary:Color.fromARGB(255, 220, 220, 220),
    tertiary: Color.fromARGB(255, 255, 94, 58), 
  ),
);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: Colors.blueAccent.withOpacity(0.4),
    selectionHandleColor: Colors.blueAccent,
    cursorColor: Colors.blueAccent,
  ),
   
  colorScheme: const ColorScheme.light(
    surface :  Color.fromARGB(255, 220, 220, 220),
    primary:  Color.fromARGB(255, 220, 220, 220),
    secondary:Color.fromARGB(255, 37, 44, 51),
    tertiary: Color.fromARGB(255, 255, 94, 58),
  ),
);