import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_styles.dart';
import '../../../models/experience_model.dart';

class TimelineItem extends StatefulWidget {
  final ExperienceModel experience;
  final int index;
  final bool isLast;

  const TimelineItem({
    super.key,
    required this.experience,
    required this.index,
    this.isLast = false,
  });

  @override
  State<TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<TimelineItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final e = widget.experience;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline column
        SizedBox(
          width: 60,
          child: Column(
            children: [
              // Dot
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.borderGlow),
                ),
                child: const Icon(Icons.work_outline_rounded,
                    color: AppColors.primary, size: 22),
              ),
              // Line
              if (!widget.isLast)
                Container(
                  width: 1, height: 40,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primary.withOpacity(0.4),
                        AppColors.primary.withOpacity(0.05),
                      ],
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
            padding: EdgeInsets.only(bottom: widget.isLast ? 0 : 32),
            child: MouseRegion(
              onEnter: (_) => setState(() => _hovered = true),
              onExit: (_) => setState(() => _hovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF111118),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _hovered ? AppColors.borderGlow : AppColors.border,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Role
                    Text(e.role,
                        style: AppStyles.headingMedium.copyWith(fontSize: 18)),
                    const SizedBox(height: 6),
                    // Meta
                    Row(
                      children: [
                        Text(e.company,
                            style: AppStyles.bodyMedium
                                .copyWith(color: AppColors.primary, fontWeight: FontWeight.w500)),
                        const Spacer(),
                        Text(e.duration,
                            style: AppStyles.bodyMedium.copyWith(fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 14),
                    // Description
                    Text(e.description, style: AppStyles.bodyMedium),
                    const SizedBox(height: 16),
                    // Tech chips
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: e.technologies
                          .map(
                            (t) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.border),
                            borderRadius: BorderRadius.circular(6),
                            color: AppColors.bgGlass,
                          ),
                          child: Text(t,
                              style: AppStyles.bodyMedium
                                  .copyWith(fontSize: 11)),
                        ),
                      )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    )
        .animate(delay: Duration(milliseconds: widget.index * 150))
        .fadeIn(duration: 600.ms)
        .slideY(begin: 0.3, end: 0);
  }
}