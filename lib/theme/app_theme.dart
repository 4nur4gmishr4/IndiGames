import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme Colors
  static const Color _lightScaffoldColor = Color(0xFFDEDEDE); // #dedede for all page backgrounds
  static const Color _lightPrimaryColor = Color(0xFFFF4E6B);
  static const Color _lightSecondaryColor = Color(0xFFFF0436);
  static const Color _lightTextColor = Color(0xFF000000);
  static const Color _lightSurfaceColor = Color(0xFFFFFFFF); // #ffffff for game tiles
  static const Color _lightGlassColor = Color(0xFFFFFFFF);

  static const Color _gameOfDayBoxColor = Color(0xFF57006B); // #57006b for game of day top box

  // Dark Theme Colors
  static const Color _darkScaffoldColor = Color(0xFF000000);
  static const Color _darkPrimaryColor = Color(0xFFFF4E6B);
  static const Color _darkSecondaryColor = Color(0xFFFF0436);
  static const Color _darkTextColor = Color.fromARGB(255, 255, 255, 255); // Muted blue-purple for readability
  static const Color _darkSurfaceColor = Color(0xFF121212);
  static const Color _darkGlassColor = Color(0xFF2A2A2A);

  // Text Styles for composite typography using SF-Pro font throughout
  static TextTheme _buildTextTheme(TextTheme base, Color textColor) {
    return base.copyWith(
      // Headlines with SF-Pro font
      displayLarge: TextStyle(
        fontFamily: 'SF-Pro',
        fontSize: 34,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        color: textColor,
      ),
      displayMedium: TextStyle(
        fontFamily: 'SF-Pro',
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
        color: textColor,
      ),
      displaySmall: TextStyle(
        fontFamily: 'SF-Pro',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.25,
        color: textColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'SF-Pro',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.25,
        color: textColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'SF-Pro',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      // Titles with SF-Pro font
      titleLarge: TextStyle(
        fontFamily: 'SF-Pro',
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontFamily: 'SF-Pro',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontFamily: 'SF-Pro',
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      // Body text with SF-Pro font
      bodyLarge: TextStyle(
        fontFamily: 'SF-Pro',
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'SF-Pro',
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        fontFamily: 'SF-Pro',
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: textColor.withAlpha(179),
        height: 1.5,
      ),
      // Labels with SF-Pro font
      labelLarge: TextStyle(
        fontFamily: 'SF-Pro',
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      labelSmall: TextStyle(
        fontFamily: 'SF-Pro',
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: textColor.withAlpha(179),
      ),
    );
  }

  // Light Theme
  static ThemeData lightTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: _lightScaffoldColor,
      colorScheme: const ColorScheme.light().copyWith(
        primary: _lightPrimaryColor,
        secondary: _lightSecondaryColor,
        onSurface: _lightTextColor,
        surface: _lightSurfaceColor,
        tertiary: _gameOfDayBoxColor,

      ),
      textTheme: _buildTextTheme(base.textTheme, _lightTextColor),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: 'SF-Pro',
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: _lightTextColor,
        ),
      ),
      cardColor: _lightGlassColor.withAlpha(179),
      iconTheme: IconThemeData(
        color: _lightTextColor,
        size: 24,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _lightSecondaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  // Dark Theme
  static ThemeData darkTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      scaffoldBackgroundColor: _darkScaffoldColor,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: _darkPrimaryColor,
        secondary: _darkSecondaryColor,
        onSurface: _darkTextColor,
        surface: _darkSurfaceColor,
        tertiary: _darkGlassColor,
      ),
      textTheme: _buildTextTheme(base.textTheme, _darkTextColor),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: 'SF-Pro',
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: _darkTextColor,
        ),
      ),
      cardColor: _darkGlassColor.withAlpha(179),
      iconTheme: IconThemeData(
        color: _darkTextColor,
        size: 24,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _darkSecondaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
