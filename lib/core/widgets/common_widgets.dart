// lib/widgets/common_widgets.dart
// Reusable UI components used across all sections

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../theme/app_theme.dart' hide AppColors;
import '../utils/responsive.dart';

// ─── Section Wrapper ─────────────────────────────────────────────────────────
/// Wraps each section with consistent padding, max-width, and background
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

// ─── Section Header ──────────────────────────────────────────────────────────
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
        // Badge chip
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.bgGlass,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary.withOpacity(0.3)),
          ),
          child: Text(badge, style: AppTextStyles.badge(13)),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.sectionTitle(
            Responsive.sectionTitleSize(context),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: AppTextStyles.body(Responsive.bodySize(context)),
            ),
          ),
        ],
        const SizedBox(height: 8),
        // Decorative underline
        Container(
          width: 60,
          height: 3,
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGrad,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

// ─── Gradient Button ─────────────────────────────────────────────────────────
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

class _GradientButtonState extends State<GradientButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_hovered ? 1.03 : 1.0),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            gradient: widget.outlined ? null : AppColors.primaryGrad,
            borderRadius: BorderRadius.circular(12),
            border: widget.outlined
                ? Border.all(color: AppColors.primary, width: 2)
                : null,
            boxShadow: _hovered && !widget.outlined
                ? [BoxShadow(
              color: AppColors.primary.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 6),
            )]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon,
                    size: 18,
                    color: widget.outlined ? AppColors.primary : AppColors.bg),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: widget.outlined ? AppColors.primary : AppColors.bg,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Glass Card ──────────────────────────────────────────────────────────────
class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool hoverable;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.hoverable = true,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => widget.hoverable
          ? setState(() => _hovered = true)
          : null,
      onExit:  (_) => widget.hoverable
          ? setState(() => _hovered = false)
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.identity()
          ..translate(0.0, _hovered ? -4.0 : 0.0),
        padding: widget.padding ?? const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: AppColors.cardGrad,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered
                ? AppColors.primary.withOpacity(0.5)
                : AppColors.border,
          ),
          boxShadow: _hovered
              ? [BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          )]
              : [BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )],
        ),
        child: widget.child,
      ),
    );
  }
}

// ─── Skill Bar ───────────────────────────────────────────────────────────────
class AnimatedSkillBar extends StatefulWidget {
  final String name;
  final double level; // 0.0 to 1.0
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
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic)
        .drive(Tween(begin: 0, end: widget.level));
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
    return Padding(
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Tech Badge ──────────────────────────────────────────────────────────────
class TechBadge extends StatelessWidget {
  final String label;

  const TechBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: GoogleFonts.spaceGrotesk(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecond,
        ),
      ),
    );
  }
}