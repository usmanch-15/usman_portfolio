// lib/screens/sections/experience_section.dart

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart' hide AppColors;
import '../../core/utils/responsive.dart';
import '../../core/widgets/common_widgets.dart';
import '../../data/portfolio_data.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionWrapper(
      child: Column(
        children: [
          FadeInUp(
            child: const SectionHeader(
              badge: '✦  Experience',
              title: 'My Work Journey',
              subtitle: 'Professional experience building mobile applications',
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),

          // Timeline
          ...List.generate(
            PortfolioData.experience.length,
                (i) => FadeInUp(
              delay: Duration(milliseconds: 150 * i),
              child: _TimelineItem(
                exp: PortfolioData.experience[i],
                isLast: i == PortfolioData.experience.length - 1,
                index: i,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final Map<String, String> exp;
  final bool isLast;
  final int index;

  const _TimelineItem({
    required this.exp,
    required this.isLast,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline indicator
          SizedBox(
            width: isMobile ? 40 : 60,
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGrad,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 12,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '0${index + 1}',
                      style: GoogleFonts.syne(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: AppColors.bg,
                      ),
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primary.withOpacity(0.6),
                            AppColors.primary.withOpacity(0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 20),

          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 32),
              child: GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Period badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: AppColors.primary.withOpacity(0.3)),
                      ),
                      child: Text(
                        exp['period']!,
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    Text(exp['role']!, style: AppTextStyles.label(18)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.business_rounded,
                            size: 14, color: AppColors.accent),
                        const SizedBox(width: 6),
                        Text(
                          exp['company']!,
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.accent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(exp['desc']!, style: AppTextStyles.body(14)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}