import 'package:flutter/material.dart';

ThemeData customTheme = ThemeData(
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Colors.blueAccent,
        ),
        foregroundColor: MaterialStatePropertyAll(
          Colors.white,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    dialogTheme: const DialogTheme(
      surfaceTintColor: Colors.transparent,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.blue,
    ),
    colorSchemeSeed: const Color(0xff1679ab));
