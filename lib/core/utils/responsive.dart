// lib/utils/responsive.dart
// Centralized breakpoints and responsive helpers

import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
          MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  /// Returns value based on current screen type
  static T value<T>(
      BuildContext context, {
        required T mobile,
        T? tablet,
        required T desktop,
      }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet ?? desktop;
    return desktop;
  }

  /// Font size that scales with screen
  static double fontSize(BuildContext context,
      {required double mobile, required double desktop}) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return (mobile + desktop) / 2;
    return desktop;
  }

  static double heroTitleSize(BuildContext context) =>
      value(context, mobile: 36.0, tablet: 52.0, desktop: 68.0);

  static double sectionTitleSize(BuildContext context) =>
      value(context, mobile: 28.0, tablet: 34.0, desktop: 42.0);

  static double bodySize(BuildContext context) =>
      value(context, mobile: 14.0, desktop: 16.0);

  static double horizontalPad(BuildContext context) =>
      value(context, mobile: 20.0, tablet: 40.0, desktop: 60.0);

  static EdgeInsets sectionPadding(BuildContext context) => EdgeInsets.symmetric(
    horizontal: horizontalPad(context),
    vertical: value(context, mobile: 60.0, desktop: 100.0),
  );
}