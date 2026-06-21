// lib/features/experience/experience_section.dart

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/common_widgets.dart';
import '../../data/portfolio_data.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  bool _visible = false;
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final exps = PortfolioData.experience;

    return VisibilityDetector(
      key: const Key('experience-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.15 && !_visible) {
          setState(() => _visible = true);
        }
      },
      child: SectionWrapper(
        child: Column(
          children: [
            FadeInUp(
              child: const SectionHeader(
                badge: '✦  Experience',
                title: 'My Work Journey',
                subtitle: 'Real projects, real impact — from Pakistan to 4 African states',
              ),
            ),
            SizedBox(height: isMobile ? 40 : 64),

            isMobile
                ? _MobileTimeline(exps: exps, visible: _visible)
                : _DesktopTimeline(
              exps: exps,
              visible: _visible,
              activeIndex: _activeIndex,
              onTap: (i) => setState(() => _activeIndex = i),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Desktop: left tabs + right detail panel
// ─────────────────────────────────────────────────────────────
class _DesktopTimeline extends StatelessWidget {
  final List<Map<String, dynamic>> exps;
  final bool visible;
  final int activeIndex;
  final ValueChanged<int> onTap;

  const _DesktopTimeline({
    required this.exps,
    required this.visible,
    required this.activeIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final exp = exps[activeIndex];
    final color = Color(exp['color'] as int);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left: tab list
        SizedBox(
          width: 280,
          child: Column(
            children: List.generate(exps.length, (i) {
              final e = exps[i];
              final c = Color(e['color'] as int);
              final isActive = i == activeIndex;

              return FadeInLeft(
                delay: Duration(milliseconds: 80 * i),
                child: GestureDetector(
                  onTap: () => onTap(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: isActive ? c.withOpacity(0.1) : const Color(0xFF111827),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isActive ? c.withOpacity(0.6) : AppColors.border,
                        width: isActive ? 1.5 : 1,
                      ),
                      boxShadow: isActive
                          ? [BoxShadow(color: c.withOpacity(0.15), blurRadius: 20)]
                          : [],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40, height: 40,
                          decoration: BoxDecoration(
                            color: c.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: c.withOpacity(0.3)),
                          ),
                          child: Center(child: Text(e['icon'] as String, style: const TextStyle(fontSize: 18))),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e['company'] as String,
                                style: GoogleFonts.syne(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: isActive ? c : AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                e['type'] as String,
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 11,
                                  color: AppColors.textMuted,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isActive)
                          Icon(Icons.chevron_right_rounded, color: c, size: 18),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),

        const SizedBox(width: 32),

        // Right: detail panel
        Expanded(
          child: FadeInRight(
            key: ValueKey(activeIndex),
            child: _DetailPanel(exp: exp, color: color),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Mobile: vertical timeline cards
// ─────────────────────────────────────────────────────────────
class _MobileTimeline extends StatelessWidget {
  final List<Map<String, dynamic>> exps;
  final bool visible;
  const _MobileTimeline({required this.exps, required this.visible});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(exps.length, (i) {
        final exp = exps[i];
        final color = Color(exp['color'] as int);
        final isLast = i == exps.length - 1;

        return FadeInUp(
          delay: Duration(milliseconds: 100 * i),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Timeline line + dot
                SizedBox(
                  width: 48,
                  child: Column(
                    children: [
                      Container(
                        width: 42, height: 42,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [color, color.withOpacity(0.5)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: color.withOpacity(0.35), blurRadius: 14)],
                        ),
                        child: Center(child: Text(exp['icon'] as String, style: const TextStyle(fontSize: 18))),
                      ),
                      if (!isLast)
                        Expanded(
                          child: Container(
                            width: 2,
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [color.withOpacity(0.5), color.withOpacity(0.05)],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
                    child: _DetailPanel(exp: exp, color: color),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Detail Panel — shared by desktop & mobile
// ─────────────────────────────────────────────────────────────
class _DetailPanel extends StatelessWidget {
  final Map<String, dynamic> exp;
  final Color color;
  const _DetailPanel({required this.exp, required this.color});

  @override
  Widget build(BuildContext context) {
    final tags = List<String>.from(exp['tags'] as List);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E293B), Color(0xFF111827)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.25)),
        boxShadow: [BoxShadow(color: color.withOpacity(0.08), blurRadius: 24, offset: const Offset(0, 8))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Type badge + period
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: color.withOpacity(0.3)),
                ),
                child: Text(
                  exp['type'] as String,
                  style: GoogleFonts.spaceGrotesk(fontSize: 11, fontWeight: FontWeight.w700, color: color),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(Icons.calendar_today_rounded, size: 12, color: AppColors.textMuted),
                  const SizedBox(width: 5),
                  Text(
                    exp['period'] as String,
                    style: GoogleFonts.spaceGrotesk(fontSize: 12, color: AppColors.textMuted, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Role
          Text(
            exp['role'] as String,
            style: GoogleFonts.syne(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 4),

          // Company
          Row(
            children: [
              Icon(Icons.business_rounded, size: 14, color: color),
              const SizedBox(width: 6),
              Text(
                exp['company'] as String,
                style: GoogleFonts.spaceGrotesk(fontSize: 14, fontWeight: FontWeight.w600, color: color),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Divider
          Container(height: 1, color: AppColors.border),
          const SizedBox(height: 16),

          // Description
          Text(
            exp['desc'] as String,
            style: AppTextStyles.body(14),
          ),
          const SizedBox(height: 20),

          // Tags
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags.map((t) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: color.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: color.withOpacity(0.2)),
              ),
              child: Text(t, style: GoogleFonts.spaceGrotesk(fontSize: 11, fontWeight: FontWeight.w600, color: color)),
            )).toList(),
          ),
        ],
      ),
    );
  }
}