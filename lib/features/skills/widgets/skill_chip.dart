import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_styles.dart';

class SkillChip extends StatefulWidget {
  final String name;
  final int level;

  const SkillChip({super.key, required this.name, required this.level});

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.primary.withOpacity(0.12) : AppColors.bgGlass,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _hovered ? AppColors.borderGlow : AppColors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.name, style: AppStyles.chipText),
            const SizedBox(width: 8),
            Text(
              '${widget.level}%',
              style: AppStyles.labelSmall.copyWith(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}