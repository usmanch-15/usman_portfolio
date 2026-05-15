import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../../models/project_model.dart';

class HeroProjectCard extends StatefulWidget {
  final ProjectModel project;
  final List<Color> gradientColors;

  const HeroProjectCard({
    super.key,
    required this.project,
    required this.gradientColors,
  });

  @override
  State<HeroProjectCard> createState() => _HeroProjectCardState();
}

class _HeroProjectCardState extends State<HeroProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _hovered ? AppColors.borderGlow : AppColors.border,
            width: 1.5,
          ),
          boxShadow: _hovered
              ? [
            BoxShadow(
              color: widget.gradientColors.first.withOpacity(0.2),
              blurRadius: 60,
              offset: const Offset(0, 30),
            )
          ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Row(
            children: [
              // Left gradient panel
              Container(
                width: 240,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: widget.gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_shipping_outlined,
                        size: 64, color: Colors.white.withOpacity(0.9)),
                    const SizedBox(height: 16),
                    const Text(
                      'LIVE',
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Country flags
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 6,
                      runSpacing: 6,
                      children: p.liveCountries
                          .map(
                            (c) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(c,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontFamily: 'Satoshi',
                              )),
                        ),
                      )
                          .toList(),
                    ),
                  ],
                ),
              ),

              // Right content
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  color: const Color(0xFF111118),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF22C55E).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: const Color(0xFF22C55E).withOpacity(0.3)),
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
                                const Text('Live in Production',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF22C55E),
                                      fontFamily: 'Satoshi',
                                      fontWeight: FontWeight.w600,
                                    )),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.border),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text('Featured',
                                style: AppStyles.labelSmall
                                    .copyWith(fontSize: 11)),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Text(p.title,
                          style: AppStyles.headingLarge.copyWith(fontSize: 28)),
                      const SizedBox(height: 6),
                      Text(p.subtitle,
                          style: AppStyles.bodyMedium
                              .copyWith(color: AppColors.primary)),
                      const SizedBox(height: 16),
                      Text(p.longDescription, style: AppStyles.bodyMedium),

                      const SizedBox(height: 24),

                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: p.technologies
                            .map(
                              (t) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.border),
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.bgGlass,
                            ),
                            child: Text(t,
                                style: AppStyles.bodyMedium
                                    .copyWith(fontSize: 12)),
                          ),
                        )
                            .toList(),
                      ),

                      const SizedBox(height: 28),

                      Row(
                        children: [
                          if (p.liveUrl != null)
                            GestureDetector(
                              onTap: () =>
                                  UrlLauncherHelper.openUrl(p.liveUrl!),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  gradient: AppColors.primaryGrad,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.open_in_new_rounded,
                                        size: 16, color: Colors.white),
                                    SizedBox(width: 8),
                                    Text('Visit Live',
                                        style: TextStyle(
                                          fontFamily: 'Satoshi',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 700.ms)
        .slideY(begin: 0.2, end: 0);
  }
}