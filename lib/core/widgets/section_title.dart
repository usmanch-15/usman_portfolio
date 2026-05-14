import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class SectionTitle extends StatelessWidget {
  final String label;
  final String title;
  final String? subtitle;
  final CrossAxisAlignment alignment;

  const SectionTitle({
    super.key,
    required this.label,
    required this.title,
    this.subtitle,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.12),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.borderGlow),
          ),
          child: Text(
            label.toUpperCase(),
            style: AppStyles.labelSmall,
          ),
        ),
        const SizedBox(height: 16),
        Text(title, style: AppStyles.headingLarge),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Text(subtitle!, style: AppStyles.bodyLarge),
        ],
      ],
    );
  }
}