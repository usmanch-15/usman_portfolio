import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Background
  static const Color bg        = Color(0xFF0A0A0F);
  static const Color bgCard    = Color(0xFF111118);
  static const Color bgGlass   = Color(0x14FFFFFF);

  // Primary
  static const Color primary   = Color(0xFF7C3AED); // violet
  static const Color secondary = Color(0xFFEC4899); // pink
  static const Color accent    = Color(0xFF06B6D4); // cyan

  // Text
  static const Color textPrimary   = Color(0xFFF8F8FF);
  static const Color textSecondary = Color(0xFF9CA3AF);
  static const Color textMuted     = Color(0xFF4B5563);

  // Border
  static const Color border     = Color(0xFF1F2937);
  static const Color borderGlow = Color(0x337C3AED);

  // Gradients
  static const LinearGradient primaryGrad = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroGrad = LinearGradient(
    colors: [Color(0xFF0A0A0F), Color(0xFF0F0A1E), Color(0xFF0A0A0F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Project gradients
  static const List<List<Color>> projectGradients = [
    [Color(0xFF667eea), Color(0xFF764ba2)], // cargopass - purple
    [Color(0xFFf093fb), Color(0xFFf5576c)], // echosee - pink
    [Color(0xFFff416c), Color(0xFFff4b2b)], // blood bank - red
    [Color(0xFF43e97b), Color(0xFF38f9d7)], // fitquest - green
    [Color(0xFF4facfe), Color(0xFF00f2fe)], // ai resume - blue
    [Color(0xFFa18cd1), Color(0xFFfbc2eb)], // github - lavender
  ];
}