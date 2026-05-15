import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../../models/project_model.dart';

class FypShowcase extends StatefulWidget {
  final ProjectModel project;

  const FypShowcase({super.key, required this.project});

  @override
  State<FypShowcase> createState() => _FypShowcaseState();
}

class _FypShowcaseState extends State<FypShowcase> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: const Color(0xFF111118),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _hovered ? AppColors.borderGlow : AppColors.border,
            width: 1.5,
          ),
          boxShadow: _hovered
              ? [
            BoxShadow(
              color: const Color(0xFFe53935).withOpacity(0.12),
              blurRadius: 40,
              offset: const Offset(0, 20),
            )
          ]
              : [],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon section — red gradient for Blood Bank
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFe53935), Color(0xFFff6f60)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Icon(Icons.bloodtype_rounded,
                    size: 40, color: Colors.white),
              ),
            ),

            const SizedBox(width: 28),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badges
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.borderGlow),
                        ),
                        child: Text('Final Year Project',
                            style: AppStyles.labelSmall.copyWith(fontSize: 11)),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFe53935).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: const Color(0xFFe53935).withOpacity(0.4)),
                        ),
                        child: const Text('Life Saving App',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFFe53935),
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Text(p.title,
                      style: AppStyles.headingMedium.copyWith(fontSize: 22)),
                  const SizedBox(height: 6),
                  Text(p.subtitle,
                      style: AppStyles.bodyMedium
                          .copyWith(color: AppColors.primary)),
                  const SizedBox(height: 12),
                  Text(p.longDescription, style: AppStyles.bodyMedium),

                  const SizedBox(height: 20),

                  // Features
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Feature('Donor registration & blood group management'),
                      _Feature('Nearby donors & blood banks via Google Maps'),
                      _Feature('Emergency blood request & real-time alerts'),
                      _Feature('Blood inventory tracking with Firebase'),
                      _Feature('Flutter + Firebase + Google Maps API'),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Tech chips
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

                  const SizedBox(height: 24),

                  // GitHub button
                  if (p.githubUrl != null)
                    GestureDetector(
                      onTap: () => UrlLauncherHelper.openUrl(p.githubUrl!),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.border),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.code,
                                size: 16, color: AppColors.textSecondary),
                            SizedBox(width: 8),
                            Text('View on GitHub',
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textSecondary,
                                )),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
        .animate(delay: 200.ms)
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.2, end: 0);
  }
}

class _Feature extends StatelessWidget {
  final String text;
  const _Feature(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline_rounded,
              size: 16, color: Color(0xFFe53935)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text,
                style: AppStyles.bodyMedium.copyWith(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}