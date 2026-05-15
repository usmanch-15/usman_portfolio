import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_styles.dart';
import '../../core/utils/responsive_helper.dart';
import '../../core/utils/url_launcher_helper.dart';
import '../../core/widgets/section_title.dart';
import 'widgets/contact_form.dart';
import 'widgets/social_links.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.sectionPadding(context);

    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            label: 'Contact',
            title: "Let's Build\nTogether",
            subtitle: 'Have a project in mind? Let\'s talk.',
          ),

          const SizedBox(height: 60),

          isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _leftPanel(),
              const SizedBox(height: 40),
              _formPanel(),
            ],
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 4, child: _leftPanel()),
              const SizedBox(width: 60),
              Expanded(flex: 5, child: _formPanel()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _leftPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Get In Touch', style: AppStyles.headingMedium.copyWith(fontSize: 20)),
        const SizedBox(height: 16),
        Text(
          'I\'m always open to discussing new projects, creative ideas, '
              'or opportunities to be part of your vision.',
          style: AppStyles.bodyMedium,
        ),

        const SizedBox(height: 32),

        // Contact cards
        _contactCard(
          icon: Icons.email_outlined,
          label: 'Email',
          value: AppStrings.email,
          onTap: () => UrlLauncherHelper.sendEmail(AppStrings.email),
        ),
        const SizedBox(height: 12),
        _contactCard(
          icon: Icons.location_on_outlined,
          label: 'Location',
          value: AppStrings.location,
        ),

        const SizedBox(height: 32),

        Text('Find me on', style: AppStyles.bodyMedium.copyWith(fontSize: 13)),
        const SizedBox(height: 12),
        const SocialLinks(),
      ],
    ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2, end: 0);
  }

  Widget _formPanel() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF111118),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: const ContactForm(),
    ).animate(delay: 200.ms).fadeIn(duration: 600.ms).slideX(begin: 0.2, end: 0);
  }

  Widget _contactCard({
    required IconData icon,
    required String label,
    required String value,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.bgGlass,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 40, height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 18, color: AppColors.primary),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: AppStyles.bodyMedium.copyWith(
                      fontSize: 11, letterSpacing: 1,
                      color: AppColors.textSecondary,
                    )),
                const SizedBox(height: 2),
                Text(value,
                    style: AppStyles.bodyMedium
                        .copyWith(color: AppColors.textPrimary, fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}