import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/typing_animation.dart';

class HeroText extends StatelessWidget {
  const HeroText({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Available badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.12),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.borderGlow),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8, height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF22C55E),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Available for Freelance Work',
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        )
            .animate()
            .fadeIn(duration: 500.ms)
            .slideY(begin: 0.3, end: 0),

        const SizedBox(height: 24),

        // Name
        Text(
          AppStrings.name,
          style: AppStyles.displayLarge.copyWith(
            fontSize: isMobile ? 42 : 72,
          ),
        )
            .animate(delay: 100.ms)
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.3, end: 0),

        const SizedBox(height: 12),

        // Typing roles
        SizedBox(
          height: isMobile ? 52 : 68,
          child: TypingAnimation(
            texts: [AppStrings.role, AppStrings.role2, AppStrings.role3],
          ),
        ).animate(delay: 200.ms).fadeIn(duration: 600.ms),

        const SizedBox(height: 24),

        // Tagline
        Text(
          AppStrings.tagline,
          style: AppStyles.bodyLarge.copyWith(fontSize: isMobile ? 15 : 18),
        )
            .animate(delay: 300.ms)
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.2, end: 0),

        const SizedBox(height: 16),

        // Bio
        Text(AppStrings.bio, style: AppStyles.bodyMedium)
            .animate(delay: 400.ms)
            .fadeIn(duration: 600.ms),

        const SizedBox(height: 40),

        // Buttons
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            CustomButton(
              label: 'View My Work',
              icon: Icons.arrow_downward_rounded,
              onTap: () {},
            ),
            CustomButton(
              label: 'Download CV',
              variant: ButtonVariant.outline,
              icon: Icons.download_rounded,
              onTap: () => UrlLauncherHelper.downloadCv(),
            ),
          ],
        )
            .animate(delay: 500.ms)
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.2, end: 0),

        const SizedBox(height: 40),

        // Social icons
        Row(
          children: [
            _socialIcon(Icons.code, AppStrings.github),
            const SizedBox(width: 12),
            _socialIcon(Icons.work_outline_rounded, AppStrings.upwork),
            const SizedBox(width: 12),
            _socialIcon(Icons.people_outline_rounded, AppStrings.linkedin),
            const SizedBox(width: 12),
            _socialIcon(Icons.email_outlined, 'mailto:${AppStrings.email}'),
          ],
        ).animate(delay: 600.ms).fadeIn(duration: 600.ms),
      ],
    );
  }

  Widget _socialIcon(IconData icon, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => UrlLauncherHelper.openUrl(url),
        child: Container(
          width: 44, height: 44,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(12),
            color: AppColors.bgGlass,
          ),
          child: Icon(icon, color: AppColors.textSecondary, size: 20),
        ),
      ),
    );
  }
}