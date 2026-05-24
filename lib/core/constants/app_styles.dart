import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  AppStyles._();

  static const TextStyle displayLarge = TextStyle(
    fontFamily: 'ClashDisplay',
    fontSize: 72,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.1,
    letterSpacing: -2,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: 'ClashDisplay',
    fontSize: 52,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.15,
    letterSpacing: -1.5,
  );

  static const TextStyle headingLarge = TextStyle(
    fontFamily: 'ClashDisplay',
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: -1,
  );

  static const TextStyle headingMedium = TextStyle(
    fontFamily: 'ClashDisplay',
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static final TextStyle bodyLarge = TextStyle(
    fontFamily: 'Satoshi',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.7,
  );

  static final TextStyle bodyMedium = TextStyle(
    fontFamily: 'Satoshi',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.6,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: 'Satoshi',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    letterSpacing: 2,
  );

  static const TextStyle chipText = TextStyle(
    fontFamily: 'Satoshi',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
}