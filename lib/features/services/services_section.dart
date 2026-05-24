// lib/features/services/services_section.dart
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/common_widgets.dart';
import '../../data/portfolio_data.dart';



class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    final crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    return SectionWrapper(
      child: Column(
        children: [
          FadeInUp(
            child: const SectionHeader(
              badge: '✦  Services',
              title: 'What I Can Build For You',
              subtitle: 'From idea to production — I handle the complete mobile development lifecycle',
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),
          _buildGrid(context, crossAxisCount),
        ],
      ),
    );
  }

  Widget _buildGrid(BuildContext context, int crossAxisCount) {
    final services = PortfolioData.services;

    if (crossAxisCount == 1) {
      return Column(
        children: List.generate(services.length, (i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: FadeInUp(
              delay: Duration(milliseconds: 100 * i),
              child: _ServiceCard(service: services[i]),
            ),
          );
        }),
      );
    }

    // Multi-column: use GridView
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.1,
      ),
      itemCount: services.length,
      itemBuilder: (context, i) => FadeInUp(
        delay: Duration(milliseconds: 100 * i),
        child: _ServiceCard(service: services[i]),
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final Map<String, String> service;
  const _ServiceCard({required this.service});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.identity()
          ..translate(0.0, _hovered ? -6.0 : 0.0),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          gradient: _hovered
              ? const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1E3A5F), Color(0xFF111827)],
          )
              : AppColors.cardGrad,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered
                ? AppColors.primary.withOpacity(0.6)
                : AppColors.border,
          ),
          boxShadow: _hovered
              ? [BoxShadow(
            color: AppColors.primary.withOpacity(0.15),
            blurRadius: 30,
            offset: const Offset(0, 12),
          )]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: AppColors.primary.withOpacity(0.2)),
              ),
              child: Center(
                child: Text(
                  widget.service['icon']!,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              widget.service['title']!,
              style: AppTextStyles.label(16),
            ),
            const SizedBox(height: 10),
            Text(
              widget.service['desc']!,
              style: AppTextStyles.body(13.5),
            ),

            const Spacer(),
            const SizedBox(height: 16),

            // Arrow indicator
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: Row(
                children: [
                  Text(
                    'Learn more',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: _hovered ? AppColors.primary : AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(width: 4),
                  AnimatedSlide(
                    duration: const Duration(milliseconds: 200),
                    offset: _hovered ? const Offset(0.3, 0) : Offset.zero,
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 14,
                      color: _hovered ? AppColors.primary : AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}