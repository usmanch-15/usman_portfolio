import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class PortfolioScrollController {
  static final AutoScrollController controller = AutoScrollController(
    viewportBoundaryGetter: () =>
        Rect.fromLTRB(0, 0, 0, MediaQueryData.fromView(
          WidgetsBinding.instance.platformDispatcher.views.first,
        ).padding.bottom),
    axis: Axis.vertical,
  );

  static Future<void> scrollToSection(int index) async {
    await controller.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
      duration: const Duration(milliseconds: 700),
    );
  }

  static void dispose() => controller.dispose();
}