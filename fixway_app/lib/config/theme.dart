import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF00327D);
  static const Color primaryContainer = Color(0xFF0047AB);
  static const Color onPrimary = Color(0xFFFFFFFF);
  
  static const Color surface = Color(0xFFFAF8FF);
  static const Color onSurface = Color(0xFF191B22);
  static const Color onSurfaceVariant = Color(0xFF434653);
  
  static const Color secondary = Color(0xFF5C5F60);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color outline = Color(0xFF737784);
  
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: Colors.white,
        secondary: secondary,
        onSecondary: onSecondary,
        error: error,
        onError: onError,
        surface: surface,
        onSurface: onSurface,
      ),
      scaffoldBackgroundColor: surface,
      fontFamily: 'Inter',
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.w600, letterSpacing: -0.02, color: onSurface, height: 1.2),
        displayMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: -0.01, color: onSurface, height: 1.25),
        displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, letterSpacing: -0.01, color: onSurface, height: 1.33),
        bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: onSurface, height: 1.55),
        bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: onSurface, height: 1.5),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.01, color: onSurface, height: 1.42),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: onSurfaceVariant, height: 1.33),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryContainer,
          foregroundColor: onPrimary,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Inter'),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryContainer,
          minimumSize: const Size(double.infinity, 56),
          side: const BorderSide(color: primaryContainer, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Inter'),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF1F5F9), // Light gray fill from design system
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primary, width: 1),
        ),
        hintStyle: const TextStyle(color: outline, fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
  }
}
