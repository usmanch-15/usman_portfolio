// lib/core/constants/app_colors.dart
// SINGLE SOURCE OF TRUTH — tamam colors yahan hain

import 'package:flutter/material.dart';

class AppColors {
  // ─── Backgrounds ────────────────────────────────────────
  static const Color bg       = Color(0xFF0A0E1A);
  static const Color bgCard   = Color(0xFF111827);
  static const Color bgGlass  = Color(0x1A38BDF8);
  static const Color surface  = Color(0xFF1E293B);

  // ─── Brand Colors ────────────────────────────────────────
  static const Color primary      = Color(0xFF38BDF8);
  static const Color primaryDark  = Color(0xFF0EA5E9);
  static const Color secondary    = Color(0xFF818CF8); // ← FIX: was missing
  static const Color accent       = Color(0xFF818CF8);
  static const Color accentGreen  = Color(0xFF34D399);

  // ─── Text ────────────────────────────────────────────────
  static const Color textPrimary   = Color(0xFFF8FAFC);
  static const Color textSecond    = Color(0xFF94A3B8);
  static const Color textSecondary = Color(0xFF94A3B8); // ← FIX: alias
  static const Color textMuted     = Color(0xFF475569);

  // ─── Border / Divider ────────────────────────────────────
  static const Color border     = Color(0xFF1E3A5F);
  static const Color borderGlow = Color(0x4038BDF8);   // ← FIX: was missing
  static const Color divider    = Color(0xFF1E293B);

  // ─── Gradients ───────────────────────────────────────────
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

  static const LinearGradient secondaryGrad = LinearGradient(
    colors: [Color(0xFF818CF8), Color(0xFF38BDF8)],
  );
}