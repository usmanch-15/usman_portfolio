// lib/utils/app_theme.dart
// Central theme file — colors, typography, spacing, decorations

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppColors {
  // Primary palette — deep navy + electric cyan
  static const Color bg           = Color(0xFF0A0E1A);
  static const Color bgCard       = Color(0xFF111827);
  static const Color bgGlass      = Color(0x1A38BDF8);
  static const Color primary      = Color(0xFF38BDF8);   // cyan-400
  static const Color primaryDark  = Color(0xFF0EA5E9);   // cyan-500
  static const Color accent       = Color(0xFF818CF8);   // indigo-400
  static const Color accentGreen  = Color(0xFF34D399);   // emerald-400
  static const Color surface      = Color(0xFF1E293B);   // slate-800
  static const Color border       = Color(0xFF1E3A5F);
  static const Color textPrimary  = Color(0xFFF8FAFC);
  static const Color textSecond   = Color(0xFF94A3B8);
  static const Color textMuted    = Color(0xFF475569);
  static const Color divider      = Color(0xFF1E293B);

  // Gradients
  static const LinearGradient heroBg = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0A0E1A), Color(0xFF0D1B2E), Color(0xFF0A0E1A)],
  );

  static const LinearGradient primaryGrad = LinearGradient(
    colors: [Color(0xFF38BDF8), Color(0xFF818CF8)],
  );

  static const LinearGradient cardGrad = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E293B), Color(0xFF111827)],
  );
}

class AppTheme {
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.surface,
    ),
    textTheme: GoogleFonts.spaceGroteskTextTheme().apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      labelStyle: const TextStyle(color: AppColors.textSecond),
      hintStyle: const TextStyle(color: AppColors.textMuted),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.bg,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.spaceGrotesk(
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
    ),
  );
}

class AppTextStyles {
  static TextStyle heroTitle(double size) => GoogleFonts.syne(
    fontSize: size,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    height: 1.1,
  );

  static TextStyle sectionTitle(double size) => GoogleFonts.syne(
    fontSize: size,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle body(double size) => GoogleFonts.spaceGrotesk(
    fontSize: size,
    color: AppColors.textSecond,
    height: 1.7,
  );

  static TextStyle label(double size) => GoogleFonts.spaceGrotesk(
    fontSize: size,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle badge(double size) => GoogleFonts.spaceGrotesk(
    fontSize: size,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
}

class AppSpacing {
  static double section(bool isMobile) => isMobile ? 60.0 : 100.0;
  static double horizontalPad(bool isMobile) => isMobile ? 20.0 : 24.0;
  static double maxWidth = 1100.0;
}