import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_styles.dart';
import '../../core/utils/responsive_helper.dart';
import '../../core/widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.sectionPadding(context);

    return Container(
      padding: padding,
      child: isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_left(), const SizedBox(height: 48), _right()],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 5, child: _left()),
          const SizedBox(width: 80),
          Expanded(flex: 4, child: _right()),
        ],
      ),
    );
  }

  Widget _left() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(
          label: 'About Me',
          title: 'Building apps that\nlive in the real world',
          subtitle: null,
        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0),

        const SizedBox(height: 32),

        Text(AppStrings.bio, style: AppStyles.bodyLarge)
            .animate(delay: 100.ms)
            .fadeIn(duration: 600.ms),

        const SizedBox(height: 16),

        Text(
          'I believe great apps solve real problems. Whether it\'s cargo logistics '
              'across Africa or AI tools for accessibility I care deeply about the '
              'impact my code makes in the world.',
          style: AppStyles.bodyMedium,
        ).animate(delay: 200.ms).fadeIn(duration: 600.ms),

        const SizedBox(height: 32),

        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            '📍 Pakistan',
            '🎓 CS Graduate',
            '💼 3+ Years Exp',
            '🌍 Live in 4 Countries',
            '⭐ 5-Star Upwork',
          ]
              .map((s) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(100),
              color: AppColors.bgGlass,
            ),
            child: Text(s, style: AppStyles.bodyMedium.copyWith(fontSize: 13)),
          ))
              .toList(),
        ).animate(delay: 300.ms).fadeIn(duration: 600.ms),
      ],
    );
  }

  Widget _right() {
    final cards = [
      {
        'icon': '🚀',
        'title': 'Live Products',
        'desc': 'Built and shipped apps running live in production across multiple countries.',
      },
      {
        'icon': '🤖',
        'title': 'AI Integration',
        'desc': 'Integrating OpenAI, Gemini, and custom ML models into Flutter apps.',
      },
      {
        'icon': '🎨',
        'title': 'UI/UX Focused',
        'desc': 'Every pixel matters. I design beautiful interfaces before writing a line of code.',
      },
      {
        'icon': '⚡',
        'title': 'Performance First',
        'desc': 'Smooth 60fps animations and optimized builds across all platforms.',
      },
    ];

    return Column(
      children: cards
          .asMap()
          .entries
          .map(
            (e) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _card(e.value)
              .animate(delay: Duration(milliseconds: 100 * e.key))
              .fadeIn(duration: 500.ms)
              .slideX(begin: 0.2, end: 0),
        ),
      )
          .toList(),
    );
  }

  Widget _card(Map<String, String> data) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF111118),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: Text(data['icon']!, style: const TextStyle(fontSize: 20))),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data['title']!, style: AppStyles.headingMedium.copyWith(fontSize: 16)),
                const SizedBox(height: 6),
                Text(data['desc']!, style: AppStyles.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}