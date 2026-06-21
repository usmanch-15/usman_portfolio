// lib/core/widgets/hover_skill_tag.dart
// Abdullah wala skill tag hover animation — float up on hover

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class HoverSkillTag extends StatefulWidget {
  final String label;
  const HoverSkillTag({super.key, required this.label});

  @override
  State<HoverSkillTag> createState() => _HoverSkillTagState();
}

class _HoverSkillTagState extends State<HoverSkillTag>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _translateY;
  late final Animation<Color?> _borderColor;
  late final Animation<Color?> _bgColor;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _translateY = Tween<double>(begin: 0, end: -6).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOut),
    );
    _borderColor = ColorTween(
      begin: AppColors.border,
      end: AppColors.primary.withOpacity(0.6),
    ).animate(_ctrl);
    _bgColor = ColorTween(
      begin: AppColors.bgGlass,
      end: AppColors.primary.withOpacity(0.10),
    ).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _ctrl.forward(),
      onExit: (_) => _ctrl.reverse(),
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (context, _) => Transform.translate(
          offset: Offset(0, _translateY.value),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: _bgColor.value,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _borderColor.value ?? AppColors.border),
              boxShadow: _ctrl.value > 0
                  ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.15 * _ctrl.value),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                )
              ]
                  : [],
            ),
            child: Text(
              widget.label,
              style: AppStyles.chipText.copyWith(
                color: Color.lerp(
                  AppColors.textSecondary,
                  AppColors.primary,
                  _ctrl.value * 0.6,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}