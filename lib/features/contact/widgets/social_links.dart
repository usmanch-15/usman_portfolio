import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/utils/url_launcher_helper.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final links = [
      {'label': 'GitHub', 'icon': Icons.code, 'url': AppStrings.github},
      {'label': 'LinkedIn', 'icon': Icons.people_outline_rounded, 'url': AppStrings.linkedin},
      {'label': 'Upwork', 'icon': Icons.work_outline_rounded, 'url': AppStrings.upwork},
      {'label': 'Email', 'icon': Icons.email_outlined, 'url': 'mailto:${AppStrings.email}'},
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: links.map((l) => _SocialChip(
        label: l['label'] as String,
        icon: l['icon'] as IconData,
        url: l['url'] as String,
      )).toList(),
    );
  }
}

class _SocialChip extends StatefulWidget {
  final String label;
  final IconData icon;
  final String url;

  const _SocialChip({
    required this.label,
    required this.icon,
    required this.url,
  });

  @override
  State<_SocialChip> createState() => _SocialChipState();
}

class _SocialChipState extends State<_SocialChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => UrlLauncherHelper.openUrl(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
              Icon(widget.icon,
                  size: 16,
                  color: _hovered ? AppColors.primary : AppColors.textSecondary),
              const SizedBox(width: 8),
              Text(widget.label,
                  style: AppStyles.bodyMedium.copyWith(
                    fontSize: 13,
                    color: _hovered ? AppColors.primary : AppColors.textSecondary,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}