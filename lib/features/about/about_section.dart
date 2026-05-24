// lib/screens/sections/about_section.dart

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';                        // FadeInUp, FadeInLeft, FadeInRight
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';                      // AppColors
import '../../core/theme/app_theme.dart';                           // AppTextStyles
import '../../core/utils/responsive.dart';                          // Responsive
import '../../core/widgets/common_widgets.dart';                    // SectionWrapper, SectionHeader, GlassCard, GradientButton
import '../../data/portfolio_data.dart';


class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionWrapper(
      child: Column(
        children: [
          FadeInUp(
            child: const SectionHeader(
              badge: '✦  About Me',
              title: 'Passionate Mobile Developer',
              subtitle: 'From Pakistan to the world — building apps that matter',
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),

          isMobile
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: _buildAvatarCard()),
        const SizedBox(width: 60),
        Expanded(flex: 7, child: _buildInfoColumn(context, false)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildAvatarCard(),
        const SizedBox(height: 32),
        _buildInfoColumn(context, true),
      ],
    );
  }

  Widget _buildAvatarCard() {
    return FadeInLeft(
      child: GlassCard(
        hoverable: false,
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            // Avatar placeholder
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.primaryGrad,
              ),
              child: Center(
                child: Text(
                  'U',
                  style: GoogleFonts.syne(
                    fontSize: 64,
                    fontWeight: FontWeight.w800,
                    color: AppColors.bg,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              PortfolioData.fullName,
              style: AppTextStyles.label(20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              PortfolioData.role,
              style: AppTextStyles.badge(14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              PortfolioData.location,
              style: AppTextStyles.body(13),
              textAlign: TextAlign.center,
            ),
            const Divider(color: AppColors.border, height: 32),
            // Quick info
            _InfoRow(Icons.email_rounded, PortfolioData.email),
            const SizedBox(height: 8),
            _InfoRow(Icons.phone_rounded, PortfolioData.phone),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(BuildContext context, bool isMobile) {
    return FadeInRight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (b) => AppColors.primaryGrad.createShader(b),
            child: Text(
              'Flutter Developer\n& Mobile Specialist',
              style: AppTextStyles.sectionTitle(
                isMobile ? 24 : 30,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            PortfolioData.aboutText.trim(),
            style: AppTextStyles.body(Responsive.bodySize(context)),
          ),
          const SizedBox(height: 28),

          // Highlights
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _HighlightChip('📱 5+ Years Flutter'),
              _HighlightChip('🔥 Firebase Expert'),
              _HighlightChip('🤖 AI Integration'),
              _HighlightChip('🚀 10+ Play Store Apps'),
            ],
          ),

          const SizedBox(height: 32),

          // Download CV button
          GradientButton(
            label: 'Download CV',
            onTap: () {},
            icon: Icons.download_rounded,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primary),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.body(13),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _HighlightChip extends StatelessWidget {
  final String label;
  const _HighlightChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Text(label,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          )),
    );
  }
}