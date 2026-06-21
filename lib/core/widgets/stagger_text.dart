// lib/core/widgets/stagger_text.dart
// Abdullah wali GSAP hero stagger animation — Flutter version
// Name → Role → Tagline sequentially animate hoti hain

import 'package:flutter/material.dart';

class StaggerText extends StatefulWidget {
  final List<Widget> children;
  final Duration itemDelay;
  final Duration itemDuration;

  const StaggerText({
    super.key,
    required this.children,
    this.itemDelay = const Duration(milliseconds: 150),
    this.itemDuration = const Duration(milliseconds: 600),
  });

  @override
  State<StaggerText> createState() => _StaggerTextState();
}

class _StaggerTextState extends State<StaggerText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final List<Animation<double>> _opacities;
  late final List<Animation<Offset>> _slides;

  @override
  void initState() {
    super.initState();

    final totalMs = widget.children.length * widget.itemDelay.inMilliseconds +
        widget.itemDuration.inMilliseconds;

    _ctrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: totalMs),
    );

    _opacities = [];
    _slides = [];

    for (int i = 0; i < widget.children.length; i++) {
      final start =
          (i * widget.itemDelay.inMilliseconds) / totalMs;
      final end =
          start + widget.itemDuration.inMilliseconds / totalMs;

      final interval = Interval(start, end.clamp(0.0, 1.0),
          curve: Curves.easeOut);

      _opacities.add(
        CurvedAnimation(parent: _ctrl, curve: interval),
      );
      _slides.add(
        Tween<Offset>(
          begin: const Offset(0, 24),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: _ctrl, curve: interval),
        ),
      );
    }

    // Start immediately
    _ctrl.forward();
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
      builder: (context, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.children.length, (i) {
            return FadeTransition(
              opacity: _opacities[i],
              child: Transform.translate(
                offset: _slides[i].value,
                child: widget.children[i],
              ),
            );
          }),
        );
      },
    );
  }
}