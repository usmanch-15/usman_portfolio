// lib/core/widgets/hero_orbs.dart
// Abdullah wale glowing orbs — hero section background mein

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class HeroOrbs extends StatelessWidget {
  final Widget child;
  const HeroOrbs({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Orb 1 — top left, blue
        Positioned(
          top: -100,
          left: -100,
          child: _orb(500, AppColors.primary.withOpacity(0.12)),
        ),
        // Orb 2 — top right, purple
        Positioned(
          top: 50,
          right: -150,
          child: _orb(450, AppColors.accent.withOpacity(0.10)),
        ),
        child,
      ],
    );
  }

  Widget _orb(double size, Color color) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: RadialGradient(
        colors: [color, Colors.transparent],
        stops: const [0.0, 1.0],
      ),
    ),
  );
}
