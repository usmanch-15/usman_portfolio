// lib/core/widgets/common_widgets.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../constants/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import 'scroll_reveal.dart';

// ─────────────────────────────────────────────────────────────
// Section Wrapper
// ─────────────────────────────────────────────────────────────
class SectionWrapper extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const SectionWrapper({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: padding ?? Responsive.sectionPadding(context),
            child: child,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Section Header — animated badge + title + underline
// ─────────────────────────────────────────────────────────────
class SectionHeader extends StatelessWidget {
  final String badge;
  final String title;
  final String? subtitle;

  const SectionHeader({
    super.key,
    required this.badge,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Badge
        ScrollReveal(
          direction: RevealDirection.scale,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColors.primary.withOpacity(0.35)),
            ),
            child: Text(badge, style: AppTextStyles.badge(13)),
          ),
        ),
        const SizedBox(height: 16),

        // Title
        ScrollReveal(
          delayMs: 100,
          child: ShaderMask(
            shaderCallback: (b) => const LinearGradient(
              colors: [Colors.white, Color(0xFFCBD5E1)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(b),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.sectionTitle(
                Responsive.sectionTitleSize(context),
              ).copyWith(color: Colors.white),
            ),
          ),
        ),

        // Subtitle
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          ScrollReveal(
            delayMs: 180,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: AppTextStyles.body(Responsive.bodySize(context)),
              ),
            ),
          ),
        ],

        const SizedBox(height: 16),

        // Animated underline
        ScrollReveal(
          delayMs: 250,
          direction: RevealDirection.scale,
          child: Container(
            width: 60,
            height: 3,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGrad,
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.5),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Gradient Button — with hover + scale
// ─────────────────────────────────────────────────────────────
class GradientButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final bool outlined;

  const GradientButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.outlined = false,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    _scale = Tween<double>(begin: 1.0, end: 1.05)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _hovered = true);
        _ctrl.forward();
      },
      onExit: (_) {
        setState(() => _hovered = false);
        _ctrl.reverse();
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: ScaleTransition(
          scale: _scale,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding:
            const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            decoration: BoxDecoration(
              gradient: widget.outlined ? null : AppColors.primaryGrad,
              borderRadius: BorderRadius.circular(12),
              border: widget.outlined
                  ? Border.all(color: AppColors.primary, width: 1.5)
                  : null,
              boxShadow: _hovered && !widget.outlined
                  ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.45),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                )
              ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    size: 18,
                    color: widget.outlined
                        ? AppColors.primary
                        : AppColors.bg,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.label,
                  style: GoogleFonts.spaceGrotesk(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: widget.outlined
                        ? AppColors.primary
                        : AppColors.bg,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Glass Card — with hover lift + glow
// ─────────────────────────────────────────────────────────────
class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool hoverable;
  final Color? accentColor;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.hoverable = true,
    this.accentColor,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final accent = widget.accentColor ?? AppColors.primary;

    return MouseRegion(
      onEnter: (_) =>
      widget.hoverable ? setState(() => _hovered = true) : null,
      onExit: (_) =>
      widget.hoverable ? setState(() => _hovered = false) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.identity()
          ..translate(0.0, _hovered ? -6.0 : 0.0),
        padding: widget.padding ?? const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _hovered
                ? [
              accent.withOpacity(0.06),
              const Color(0xFF111827),
            ]
                : [
              const Color(0xFF1E293B),
              const Color(0xFF111827),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered
                ? accent.withOpacity(0.5)
                : AppColors.border,
            width: _hovered ? 1.5 : 1,
          ),
          boxShadow: _hovered
              ? [
            BoxShadow(
              color: accent.withOpacity(0.12),
              blurRadius: 32,
              offset: const Offset(0, 12),
            )
          ]
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: widget.child,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Animated Skill Bar
// ─────────────────────────────────────────────────────────────
class AnimatedSkillBar extends StatefulWidget {
  final String name;
  final double level;
  final String category;
  final bool animate;

  const AnimatedSkillBar({
    super.key,
    required this.name,
    required this.level,
    required this.category,
    this.animate = false,
  });

  @override
  State<AnimatedSkillBar> createState() => _AnimatedSkillBarState();
}

class _AnimatedSkillBarState extends State<AnimatedSkillBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic)
        .drive(Tween(begin: 0.0, end: widget.level));
    if (widget.animate) _ctrl.forward();
  }

  @override
  void didUpdateWidget(AnimatedSkillBar old) {
    super.didUpdateWidget(old);
    if (widget.animate && !old.animate) _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollReveal(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.name, style: AppTextStyles.label(14)),
                AnimatedBuilder(
                  animation: _anim,
                  builder: (_, __) => Text(
                    '${(_anim.value * 100).round()}%',
                    style: AppTextStyles.badge(13),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(3),
              ),
              child: AnimatedBuilder(
                animation: _anim,
                builder: (_, __) => FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: _anim.value,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGrad,
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.5),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Tech Badge
// ─────────────────────────────────────────────────────────────
class TechBadge extends StatefulWidget {
  final String label;
  const TechBadge({super.key, required this.label});

  @override
  State<TechBadge> createState() => _TechBadgeState();
}

class _TechBadgeState extends State<TechBadge> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding:
        const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.primary.withOpacity(0.1)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _hovered
                ? AppColors.primary.withOpacity(0.5)
                : AppColors.border,
          ),
        ),
        child: Text(
          widget.label,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: _hovered ? AppColors.primary : AppColors.textSecond,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Number Counter — animated counting up
// ─────────────────────────────────────────────────────────────
class CountUpWidget extends StatefulWidget {
  final String value;
  final String label;
  final double fontSize;

  const CountUpWidget({
    super.key,
    required this.value,
    required this.label,
    this.fontSize = 32,
  });

  @override
  State<CountUpWidget> createState() => _CountUpWidgetState();
}

class _CountUpWidgetState extends State<CountUpWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;
  bool _triggered = false;
  final _key = UniqueKey().toString();

  // Parse number from "15+" → 15
  int get _target {
    final cleaned = widget.value.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(cleaned) ?? 0;
  }

  String get _suffix =>
      widget.value.replaceAll(RegExp(r'[0-9]'), '');

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _anim = Tween<double>(begin: 0, end: _target.toDouble()).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(_key),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3 && !_triggered) {
          _triggered = true;
          _ctrl.forward();
        }
      },
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _anim,
            builder: (_, __) => ShaderMask(
              shaderCallback: (b) =>
                  AppColors.primaryGrad.createShader(b),
              child: Text(
                '${_anim.value.round()}$_suffix',
                style: GoogleFonts.syne(
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(widget.label,
              style: AppTextStyles.body(12),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}