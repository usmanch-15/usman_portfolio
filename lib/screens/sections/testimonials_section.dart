// lib/screens/sections/testimonials_section.dart

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart' hide AppColors;
import '../../core/utils/responsive.dart';
import '../../core/widgets/common_widgets.dart';
import '../../data/portfolio_data.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final PageController _pageCtrl = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      color: AppColors.bgCard,
      child: SectionWrapper(
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            FadeInUp(
              child: const SectionHeader(
                badge: '✦  Testimonials',
                title: 'What Clients Say',
                subtitle: 'Feedback from amazing people I\'ve worked with',
              ),
            ),
            SizedBox(height: isMobile ? 40 : 60),

            if (isMobile)
              _buildMobileCarousel(context)
            else
              _buildDesktopGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopGrid(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    final count = isTablet ? 2 : 3;
    final testimonials = PortfolioData.testimonials;

    return Row(
      children: List.generate(
        count > testimonials.length ? testimonials.length : count,
            (i) => Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: i < count - 1 ? 20.0 : 0),
            child: FadeInUp(
              delay: Duration(milliseconds: 150 * i),
              child: _TestimonialCard(t: testimonials[i]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileCarousel(BuildContext context) {
    final testimonials = PortfolioData.testimonials;
    return Column(
      children: [
        SizedBox(
          height: 260,
          child: PageView.builder(
            controller: _pageCtrl,
            itemCount: testimonials.length,
            onPageChanged: (p) => setState(() => _currentPage = p),
            itemBuilder: (_, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: _TestimonialCard(t: testimonials[i]),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            testimonials.length,
                (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _currentPage == i ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: _currentPage == i
                    ? AppColors.primary
                    : AppColors.textMuted,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final Map<String, String> t;
  const _TestimonialCard({required this.t});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stars
          Row(
            children: List.generate(
              5,
                  (_) => const Icon(Icons.star_rounded,
                  color: Color(0xFFFBBF24), size: 18),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '"${t['text']}"',
            style: AppTextStyles.body(14),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          const SizedBox(height: 20),
          Row(
            children: [
              // Avatar
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGrad,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    t['initials']!,
                    style: GoogleFonts.syne(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.bg,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t['name']!, style: AppTextStyles.label(14)),
                  Text(t['role']!, style: AppTextStyles.body(12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}