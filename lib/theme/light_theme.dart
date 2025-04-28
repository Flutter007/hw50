import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.lightBlue.shade400,
);
final defaultTheme = ThemeData.light();
final lightTheme = defaultTheme.copyWith(
  colorScheme: lightColorScheme,
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: lightColorScheme.primaryContainer,
    foregroundColor: lightColorScheme.onPrimaryContainer,
  ),

  inputDecorationTheme: InputDecorationTheme(
    focusColor: lightColorScheme.surface,
    labelStyle: TextStyle(color: lightColorScheme.onSurface, fontSize: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.surface, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.surface, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.onSurface, width: 2),
    ),
  ),

  scaffoldBackgroundColor: lightColorScheme.inversePrimary,
  cardTheme: CardTheme().copyWith(color: lightColorScheme.surface),
  textTheme: GoogleFonts.interTextTheme(),
);
