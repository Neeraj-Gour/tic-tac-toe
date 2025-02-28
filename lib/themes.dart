import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// secondry container color code : const Color(0xFF0E1E3A)

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
      primaryContainer: Color(0xFF7DDAD9),
      secondaryContainer: Color(0xFFD8F0FA)),
  scaffoldBackgroundColor: const Color(0xFFD8F0FA),
  appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF7DDAD9)),
  textTheme: GoogleFonts.dmSerifTextTextTheme(),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
      primaryContainer: Color(0xFF5F6B84),
      secondaryContainer: Color(0xFF0E1E3A)),
  scaffoldBackgroundColor: const Color(0xFF323D5B),
  appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF5F6B84)),
  textTheme: GoogleFonts.dmSerifTextTextTheme(),
);
