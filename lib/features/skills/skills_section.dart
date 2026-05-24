// lib/features/skills/skills_section.dart
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../core/constants/app_colors.dart';                     // SIRF app_colors.dart — app_theme.dart IMPORT MAT KARO dono saath
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/common_widgets.dart';
import '../../data/portfolio_data.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return VisibilityDetector(
      key: const Key('skills-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_visible) {
          setState(() => _visible = true);
        }
      },
      child: Container(
        width: double.infinity,
        color: AppColors.bgCard,
        child: SectionWrapper(
          backgroundColor: Colors.transparent,
          child: Column(
            children: [
              FadeInUp(
                child: const SectionHeader(
                  badge: '✦  Skills',
                  title: 'My Technical Arsenal',
                  subtitle: 'Technologies I work with daily to build production-grade apps',
                ),
              ),
              SizedBox(height: isMobile ? 40 : 60),

              // Skill bars grid
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: isMobile
                    ? Column(
                  children: PortfolioData.skills
                      .map((s) => AnimatedSkillBar(
                    name: s['name'],
                    level: s['level'],
                    category: s['category'],
                    animate: _visible,
                  ))
                      .toList(),
                )
                    : _buildGridSkills(),
              ),

              SizedBox(height: isMobile ? 40 : 60),

              // Tech stack badges
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: Column(
                  children: [
                    Text(
                      'Tech Stack & Tools',
                      style: AppTextStyles.label(18),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: PortfolioData.techStack
                          .map((t) => TechBadge(label: t))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridSkills() {
    final half = (PortfolioData.skills.length / 2).ceil();
    final left = PortfolioData.skills.sublist(0, half);
    final right = PortfolioData.skills.sublist(half);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: left
                .map((s) => AnimatedSkillBar(
              name: s['name'],
              level: s['level'],
              category: s['category'],
              animate: _visible,
            ))
                .toList(),
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          child: Column(
            children: right
                .map((s) => AnimatedSkillBar(
              name: s['name'],
              level: s['level'],
              category: s['category'],
              animate: _visible,
            ))
                .toList(),
          ),
        ),
      ],
    );
  }
}