import 'package:flutter/material.dart';
import '../constants/app_dimensions.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppDimensions.mobileBreak;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppDimensions.mobileBreak &&
          MediaQuery.of(context).size.width < AppDimensions.desktopBreak;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppDimensions.desktopBreak;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static EdgeInsets sectionPadding(BuildContext context) {
    final w = screenWidth(context);
    if (w < AppDimensions.mobileBreak) {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 60);
    } else if (w < AppDimensions.desktopBreak) {
      return const EdgeInsets.symmetric(horizontal: 40, vertical: 80);
    }
    return const EdgeInsets.symmetric(horizontal: 80, vertical: 100);
  }

  static double fontSize(BuildContext context,
      {required double mobile, required double desktop}) {
    return isMobile(context) ? mobile : desktop;
  }
}