import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AnimatedGradientBg extends StatefulWidget {
  final Widget child;
  const AnimatedGradientBg({super.key, required this.child});

  @override
  State<AnimatedGradientBg> createState() => _AnimatedGradientBgState();
}

class _AnimatedGradientBgState extends State<AnimatedGradientBg>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (ctx, child) {
        final t = _ctrl.value;
        return Stack(
          children: [
            Container(color: AppColors.bg),
            Positioned(
              left: -100 + 60 * sin(t * 2 * pi),
              top: -80 + 40 * cos(t * 2 * pi),
              child: _orb(400, AppColors.primary.withOpacity(0.18)),
            ),
            Positioned(
              right: -120 + 80 * cos(t * 2 * pi + 1),
              top: 200 + 60 * sin(t * 2 * pi + 1),
              child: _orb(350, AppColors.secondary.withOpacity(0.13)),
            ),
            Positioned(
              left: 200 + 40 * sin(t * 2 * pi + 2),
              bottom: -60 + 30 * cos(t * 2 * pi + 2),
              child: _orb(280, AppColors.accent.withOpacity(0.10)),
            ),
            child!,
          ],
        );
      },
      child: widget.child,
    );
  }

  Widget _orb(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, Colors.transparent],
        ),
      ),
    );
  }
}