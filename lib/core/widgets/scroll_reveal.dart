// lib/core/widgets/scroll_reveal.dart
// Global scroll-triggered animation widget
// Wrap ANY widget with ScrollReveal() — it will pop in when scrolled into view

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

enum RevealDirection { up, down, left, right, scale, fade }

class ScrollReveal extends StatefulWidget {
  final Widget child;
  final RevealDirection direction;
  final int delayMs;
  final int durationMs;
  final double visibilityThreshold;

  const ScrollReveal({
    super.key,
    required this.child,
    this.direction = RevealDirection.up,
    this.delayMs = 0,
    this.durationMs = 600,
    this.visibilityThreshold = 0.1,
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;
  late Animation<double> _scale;
  bool _triggered = false;
  final String _key = UniqueKey().toString();

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.durationMs),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _ctrl, curve: const Interval(0, 0.7, curve: Curves.easeOut)),
    );

    _scale = Tween<double>(begin: 0.85, end: 1).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic),
    );

    Offset begin;
    switch (widget.direction) {
      case RevealDirection.up:    begin = const Offset(0, 0.18); break;
      case RevealDirection.down:  begin = const Offset(0, -0.18); break;
      case RevealDirection.left:  begin = const Offset(0.18, 0); break;
      case RevealDirection.right: begin = const Offset(-0.18, 0); break;
      default:                    begin = Offset.zero;
    }

    _slide = Tween<Offset>(begin: begin, end: Offset.zero).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _trigger() {
    if (_triggered) return;
    _triggered = true;
    Future.delayed(Duration(milliseconds: widget.delayMs), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(_key),
      onVisibilityChanged: (info) {
        if (info.visibleFraction >= widget.visibilityThreshold) _trigger();
      },
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (_, child) {
          if (widget.direction == RevealDirection.scale) {
            return Opacity(
              opacity: _opacity.value,
              child: Transform.scale(scale: _scale.value, child: child),
            );
          }
          if (widget.direction == RevealDirection.fade) {
            return Opacity(opacity: _opacity.value, child: child);
          }
          return Opacity(
            opacity: _opacity.value,
            child: SlideTransition(position: _slide, child: child),
          );
        },
        child: widget.child,
      ),
    );
  }
}

// ── Staggered children — wrap a list, each child pops with delay ──
class StaggerReveal extends StatelessWidget {
  final List<Widget> children;
  final RevealDirection direction;
  final int baseDelayMs;
  final int stepMs;
  final int durationMs;

  const StaggerReveal({
    super.key,
    required this.children,
    this.direction = RevealDirection.up,
    this.baseDelayMs = 0,
    this.stepMs = 80,
    this.durationMs = 550,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(children.length, (i) => ScrollReveal(
        direction: direction,
        delayMs: baseDelayMs + i * stepMs,
        durationMs: durationMs,
        child: children[i],
      )),
    );
  }
}