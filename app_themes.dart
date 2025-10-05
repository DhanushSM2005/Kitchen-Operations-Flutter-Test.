import 'package:flutter/material.dart';

const Color primaryDark = Color(0xFF000000);
const Color cardDark = Color(0xFF1E1E1E);
const Color textPrimaryDark = Color(0xFFFFFFFF);
const Color textSecondaryDark = Color(0xFF808080);
const Color accentColor = Color(0xFF388E3C);
const Color primaryLight = Color(0xFFFFFFFF);
const Color cardLight = Color(0xFFF5F5F5);
const Color textPrimaryLight = Color(0xFF333333);
const Color textSecondaryLight = Color(0xFF6A6A6A);

class AppThemes {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: primaryDark,
    cardColor: cardDark,
    primaryColor: accentColor,
    canvasColor: cardDark,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2C2C2C),
      hintStyle: const TextStyle(color: textSecondaryDark),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: primaryDark,
      elevation: 0,
      iconTheme: IconThemeData(color: textPrimaryDark),
      titleTextStyle: TextStyle(
        color: textPrimaryDark,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: textPrimaryDark,
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
      bodyLarge: TextStyle(color: textPrimaryDark, fontSize: 16),
      bodyMedium: TextStyle(color: textSecondaryDark, fontSize: 14),
      labelLarge: TextStyle(
        color: textPrimaryDark,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: primaryLight,
    cardColor: cardLight,
    primaryColor: accentColor,
    canvasColor: primaryLight,

    // Define input decoration for light theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFE0E0E0),
      hintStyle: const TextStyle(color: textSecondaryLight),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: primaryLight,
      elevation: 0,
      iconTheme: IconThemeData(color: textPrimaryLight),
      titleTextStyle: TextStyle(
        color: textPrimaryLight,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: textPrimaryLight,
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
      bodyLarge: TextStyle(color: textPrimaryLight, fontSize: 16),
      bodyMedium: TextStyle(color: textSecondaryLight, fontSize: 14),
      labelLarge: TextStyle(
        color: textPrimaryLight,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    notifyListeners();
  }
}
