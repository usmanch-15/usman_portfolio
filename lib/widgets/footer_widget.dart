// lib/widgets/footer_widget.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants/app_colors.dart';
import '../core/theme/app_theme.dart' hide AppColors;
import '../core/utils/responsive.dart';
import '../data/portfolio_data.dart';


class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: const Color(0xFF070B14),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPad(context),
        vertical: 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              // Divider
              Container(
                height: 1,
                margin: const EdgeInsets.only(bottom: 32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.transparent,
                    AppColors.border,
                    Colors.transparent,
                  ]),
                ),
              ),

              isMobile
                  ? _buildMobile(context)
                  : _buildDesktop(context),

              const SizedBox(height: 24),

              // Copyright
              Text(
                '© ${DateTime.now().year} ${PortfolioData.fullName} · Made with ❤️ using Flutter',
                style: AppTextStyles.body(13),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        _buildLinks(),
        _buildSocials(),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      children: [
        _buildLogo(),
        const SizedBox(height: 24),
        _buildLinks(),
        const SizedBox(height: 24),
        _buildSocials(),
      ],
    );
  }

  Widget _buildLogo() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'U',
            style: GoogleFonts.syne(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
            ),
          ),
          TextSpan(
            text: 'sman',
            style: GoogleFonts.syne(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          TextSpan(
            text: '.',
            style: GoogleFonts.syne(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinks() {
    const links = ['Home', 'About', 'Projects', 'Contact'];
    return Wrap(
      spacing: 20,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: links.map((l) => GestureDetector(
        onTap: () {},
        child: Text(
          l,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecond,
          ),
        ),
      )).toList(),
    );
  }

  Widget _buildSocials() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SocialIcon(Icons.code_rounded, 'GitHub', () {}),
        const SizedBox(width: 8),
        _SocialIcon(Icons.work_outline_rounded, 'LinkedIn', () {}),
        const SizedBox(width: 8),
        _SocialIcon(Icons.email_outlined, 'Email', () {}),
      ],
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _SocialIcon(this.icon, this.tooltip, this.onTap);

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit:  (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _hovered
                  ? AppColors.primary.withOpacity(0.15)
                  : AppColors.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _hovered ? AppColors.primary : AppColors.border,
              ),
            ),
            child: Icon(
              widget.icon,
              size: 16,
              color: _hovered ? AppColors.primary : AppColors.textSecond,
            ),
          ),
        ),
      ),
    );
  }
}