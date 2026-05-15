import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../../models/project_model.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final List<Color> gradientColors;
  final int index;

  const ProjectCard({
    super.key,
    required this.project,
    required this.gradientColors,
    this.index = 0,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(0, _hovered ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: const Color(0xFF111118),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered ? AppColors.borderGlow : AppColors.border,
          ),
          boxShadow: _hovered
              ? [
            BoxShadow(
              color: widget.gradientColors.first.withOpacity(0.15),
              blurRadius: 40,
              offset: const Offset(0, 20),
            )
          ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gradient header
            Container(
              height: 130,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: widget.gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Center(
                child: Icon(
                  _iconFromName(p.iconName),
                  size: 48,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status badge
                  Row(
                    children: [
                      if (p.isLive)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF22C55E).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color:
                                const Color(0xFF22C55E).withOpacity(0.3)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 6, height: 6,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF22C55E),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Text('Live',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF22C55E),
                                      fontFamily: 'Satoshi',
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      if (p.isFyp) ...[
                        if (p.isLive) const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: AppColors.borderGlow),
                          ),
                          child: const Text('FYP',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: AppColors.primary,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text(p.title,
                      style: AppStyles.headingMedium.copyWith(fontSize: 18)),
                  const SizedBox(height: 4),
                  Text(p.subtitle,
                      style: AppStyles.bodyMedium
                          .copyWith(color: AppColors.primary, fontSize: 13)),
                  const SizedBox(height: 10),
                  Text(p.description,
                      style: AppStyles.bodyMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis),

                  if (p.liveCountries.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: p.liveCountries
                          .map(
                            (c) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color:
                            const Color(0xFF22C55E).withOpacity(0.08),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: const Color(0xFF22C55E)
                                    .withOpacity(0.2)),
                          ),
                          child: Text(c,
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF22C55E),
                                  fontFamily: 'Satoshi')),
                        ),
                      )
                          .toList(),
                    ),
                  ],

                  const SizedBox(height: 16),

                  // Tech chips
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: p.technologies
                        .take(4)
                        .map(
                          (t) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.bgGlass,
                        ),
                        child: Text(t,
                            style:
                            AppStyles.bodyMedium.copyWith(fontSize: 11)),
                      ),
                    )
                        .toList(),
                  ),

                  const SizedBox(height: 20),

                  // Links
                  Row(
                    children: [
                      if (p.githubUrl != null)
                        _link(
                          label: 'GitHub',
                          icon: Icons.code,
                          onTap: () => UrlLauncherHelper.openUrl(p.githubUrl!),
                          outline: true,
                        ),
                      if (p.githubUrl != null && p.liveUrl != null)
                        const SizedBox(width: 10),
                      if (p.liveUrl != null)
                        _link(
                          label: 'Live',
                          icon: Icons.open_in_new_rounded,
                          onTap: () => UrlLauncherHelper.openUrl(p.liveUrl!),
                          outline: false,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
        .animate(delay: Duration(milliseconds: widget.index * 100))
        .fadeIn(duration: 500.ms)
        .slideY(begin: 0.3, end: 0);
  }

  Widget _link({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
    required bool outline,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          gradient: outline ? null : AppColors.primaryGrad,
          border: outline ? Border.all(color: AppColors.border) : null,
          borderRadius: BorderRadius.circular(8),
          color: outline ? Colors.transparent : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 14,
                color: outline ? AppColors.textSecondary : Colors.white),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: outline ? AppColors.textSecondary : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconFromName(String name) {
    switch (name) {
      case 'local_shipping': return Icons.local_shipping_outlined;
      case 'visibility': return Icons.visibility_outlined;
      case 'favorite': return Icons.favorite_outline;
      case 'fitness_center': return Icons.fitness_center;
      case 'description': return Icons.description_outlined;
      default: return Icons.code;
    }
  }
}