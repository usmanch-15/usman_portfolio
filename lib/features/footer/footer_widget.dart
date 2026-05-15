import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_styles.dart';
import '../../core/utils/url_launcher_helper.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Logo + copyright
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (b) => AppColors.primaryGrad.createShader(b),
                child: const Text(
                  'USMAN.DEV',
                  style: TextStyle(
                    fontFamily: 'ClashDisplay',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '© 2024 ${AppStrings.name}. All rights reserved.',
                style: AppStyles.bodyMedium.copyWith(fontSize: 12),
              ),
            ],
          ),

          // Right: Quick links
          Row(
            children: [
              _footerLink('GitHub', AppStrings.github),
              const SizedBox(width: 24),
              _footerLink('LinkedIn', AppStrings.linkedin),
              const SizedBox(width: 24),
              _footerLink('Upwork', AppStrings.upwork),
              const SizedBox(width: 24),
              _footerLink('Email', 'mailto:${AppStrings.email}'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String label, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => UrlLauncherHelper.openUrl(url),
        child: Text(
          label,
          style: AppStyles.bodyMedium.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}