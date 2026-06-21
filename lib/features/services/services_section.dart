// lib/features/services/services_section.dart

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/common_widgets.dart';
import '../../data/portfolio_data.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  bool _visible = false;
  int? _hoveredIndex;

  // Accent color per service index
  static const _colors = [
    Color(0xFF38BDF8), // Flutter
    Color(0xFF818CF8), // MERN
    Color(0xFF34D399), // Firebase
    Color(0xFFA855F7), // AI
    Color(0xFFEC4899), // UI/UX
    Color(0xFFF59E0B), // Performance
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final services = PortfolioData.services;

    return VisibilityDetector(
      key: const Key('services-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_visible) setState(() => _visible = true);
      },
      child: SectionWrapper(
        child: Column(
          children: [
            FadeInUp(
              child: const SectionHeader(
                badge: '✦  Services',
                title: 'What I Can Build For You',
                subtitle: 'From idea to production — complete development across mobile, web & AI',
              ),
            ),
            SizedBox(height: isMobile ? 40 : 60),

            isMobile
                ? _buildMobileList(services)
                : _buildDesktopGrid(services, isTablet),

            SizedBox(height: isMobile ? 40 : 60),

            // CTA Banner
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: _CTABanner(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopGrid(List<Map<String, String>> services, bool isTablet) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isTablet ? 2 : 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.05,
      ),
      itemCount: services.length,
      itemBuilder: (_, i) => FadeInUp(
        delay: Duration(milliseconds: 80 * i),
        child: _ServiceCard(
          service: services[i],
          accent: _colors[i % _colors.length],
          index: i,
        ),
      ),
    );
  }

  Widget _buildMobileList(List<Map<String, String>> services) {
    return Column(
      children: List.generate(services.length, (i) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: FadeInUp(
          delay: Duration(milliseconds: 80 * i),
          child: _ServiceCard(
            service: services[i],
            accent: _colors[i % _colors.length],
            index: i,
          ),
        ),
      )),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Service Card
// ─────────────────────────────────────────────────────────────
class _ServiceCard extends StatefulWidget {
  final Map<String, String> service;
  final Color accent;
  final int index;
  const _ServiceCard({required this.service, required this.accent, required this.index});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> with SingleTickerProviderStateMixin {
  bool _hovered = false;
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _scale = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final c = widget.accent;

    return MouseRegion(
      onEnter: (_) { setState(() => _hovered = true); _ctrl.forward(); },
      onExit:  (_) { setState(() => _hovered = false); _ctrl.reverse(); },
      child: ScaleTransition(
        scale: _scale,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: _hovered
                  ? [c.withOpacity(0.1), const Color(0xFF111827)]
                  : [const Color(0xFF1E293B), const Color(0xFF111827)],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: _hovered ? c.withOpacity(0.55) : AppColors.border, width: _hovered ? 1.5 : 1),
            boxShadow: _hovered
                ? [BoxShadow(color: c.withOpacity(0.2), blurRadius: 30, offset: const Offset(0, 12))]
                : [BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 10, offset: const Offset(0, 4))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon box
              Container(
                width: 54, height: 54,
                decoration: BoxDecoration(
                  color: c.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: c.withOpacity(0.25)),
                ),
                child: Center(child: Text(widget.service['icon']!, style: const TextStyle(fontSize: 24))),
              ),
              const SizedBox(height: 18),

              // Title
              Text(
                widget.service['title']!,
                style: GoogleFonts.syne(fontSize: 15, fontWeight: FontWeight.w800,
                    color: _hovered ? c : AppColors.textPrimary),
              ),
              const SizedBox(height: 10),

              // Desc
              Expanded(
                child: Text(widget.service['desc']!, style: AppTextStyles.body(13.5)),
              ),

              const SizedBox(height: 16),

              // Bottom row: accent line + arrow
              Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 2,
                    width: _hovered ? 48 : 24,
                    decoration: BoxDecoration(
                      color: c,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 10),
                  AnimatedSlide(
                    duration: const Duration(milliseconds: 250),
                    offset: _hovered ? Offset.zero : const Offset(-0.3, 0),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _hovered ? 1 : 0,
                      child: Icon(Icons.arrow_forward_rounded, size: 16, color: c),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// CTA Banner at bottom of services
// ─────────────────────────────────────────────────────────────
class _CTABanner extends StatefulWidget {
  @override
  State<_CTABanner> createState() => _CTABannerState();
}

class _CTABannerState extends State<_CTABanner> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48, vertical: 36),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _hovered
                ? [const Color(0xFF1E3A5F), const Color(0xFF1A1040)]
                : [const Color(0xFF1E293B), const Color(0xFF111827)],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _hovered ? AppColors.primary.withOpacity(0.5) : AppColors.border,
          ),
          boxShadow: _hovered
              ? [BoxShadow(color: AppColors.primary.withOpacity(0.12), blurRadius: 40)]
              : [],
        ),
        child: isMobile
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _bannerText(),
            const SizedBox(height: 24),
            _bannerButton(),
          ],
        )
            : Row(
          children: [
            Expanded(child: _bannerText()),
            _bannerButton(),
          ],
        ),
      ),
    );
  }

  Widget _bannerText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (b) => AppColors.primaryGrad.createShader(b),
          child: Text(
            "Have a project in mind?",
            style: GoogleFonts.syne(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Let's turn your idea into a high-performance app. I'm available for freelance work.",
          style: AppTextStyles.body(14),
        ),
      ],
    );
  }

  Widget _bannerButton() {
    return GradientButton(
      label: "Let's Talk",
      onTap: () {},
      icon: Icons.send_rounded,
    );
  }
}