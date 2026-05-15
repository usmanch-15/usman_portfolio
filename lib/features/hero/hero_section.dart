import 'package:flutter/material.dart';
import '../../core/utils/responsive_helper.dart';
import 'widgets/hero_text.dart';
import 'widgets/hero_visual.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.sectionPadding(context);

    return Container(
      constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
      padding: padding.copyWith(top: 100),
      child: isMobile
          ? const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeroText(),
          SizedBox(height: 60),
          HeroVisual(),
        ],
      )
          : const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 5, child: HeroText()),
          SizedBox(width: 60),
          Expanded(flex: 4, child: HeroVisual()),
        ],
      ),
    );
  }
}