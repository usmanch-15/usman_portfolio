// lib/features/about/about_section.dart

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/common_widgets.dart';
import '../../data/portfolio_data.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return VisibilityDetector(
      key: const Key('about-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.15 && !_visible) {
          setState(() => _visible = true);
        }
      },
      child: SectionWrapper(
        child: Column(
          children: [
            // ── Header ──
            FadeInUp(
              child: const SectionHeader(
                badge: '✦  About Me',
                title: 'Flutter & MERN Stack Developer',
                subtitle: 'From Pakistan to the world — building apps that matter',
              ),
            ),
            SizedBox(height: isMobile ? 40 : 60),

            // ── Body ──
            isMobile
                ? _buildMobile(context)
                : _buildDesktop(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: _AvatarCard(visible: _visible)),
        const SizedBox(width: 60),
        Expanded(flex: 7, child: _InfoColumn(visible: _visible, isMobile: false)),
      ],
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      children: [
        _AvatarCard(visible: _visible),
        const SizedBox(height: 32),
        _InfoColumn(visible: _visible, isMobile: true),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Avatar / Profile Card (left side)
// ─────────────────────────────────────────────────────────────
class _AvatarCard extends StatefulWidget {
  final bool visible;
  const _AvatarCard({required this.visible});

  @override
  State<_AvatarCard> createState() => _AvatarCardState();
}

class _AvatarCardState extends State<_AvatarCard> with SingleTickerProviderStateMixin {
  late AnimationController _pulse;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
    _scale = Tween<double>(begin: 1.0, end: 1.06).animate(
      CurvedAnimation(parent: _pulse, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() { _pulse.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: GlassCard(
        hoverable: false,
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            // Pulsing avatar circle
            ScaleTransition(
              scale: _scale,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.primaryGrad,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.4),
                      blurRadius: 30,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'U',
                    style: GoogleFonts.syne(
                      fontSize: 68,
                      fontWeight: FontWeight.w800,
                      color: AppColors.bg,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),

            // Name
            Text(
              PortfolioData.fullName,
              style: AppTextStyles.label(20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),

            // Role badge (gradient text)
            ShaderMask(
              shaderCallback: (b) => AppColors.primaryGrad.createShader(b),
              child: Text(
                PortfolioData.role,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 6),
            Text(PortfolioData.location, style: AppTextStyles.body(13), textAlign: TextAlign.center),

            const Divider(color: AppColors.border, height: 32),

            _InfoRow(Icons.email_rounded, PortfolioData.email),
            const SizedBox(height: 8),
            _InfoRow(Icons.phone_rounded, PortfolioData.phone),
            const SizedBox(height: 16),

            // Stats row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatBubble('15+', 'Projects'),
                _StatBubble('3+', 'Years'),
                _StatBubble('3', 'Domains'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatBubble extends StatelessWidget {
  final String number;
  final String label;
  const _StatBubble(this.number, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (b) => AppColors.primaryGrad.createShader(b),
          child: Text(number, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white)),
        ),
        Text(label, style: AppTextStyles.body(11)),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Info column (right side)
// ─────────────────────────────────────────────────────────────
class _InfoColumn extends StatelessWidget {
  final bool visible;
  final bool isMobile;
  const _InfoColumn({required this.visible, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gradient heading
          ShaderMask(
            shaderCallback: (b) => AppColors.primaryGrad.createShader(b),
            child: Text(
              'Flutter & MERN Stack\nDeveloper',
              style: AppTextStyles.sectionTitle(isMobile ? 24 : 30),
            ),
          ),
          const SizedBox(height: 20),

          // About text
          Text(
            PortfolioData.aboutText.trim(),
            style: AppTextStyles.body(Responsive.bodySize(context)),
          ),
          const SizedBox(height: 28),

          // Highlight chips with staggered animation
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _chip('📱 Flutter Developer',   0,   visible),
              _chip('🌐 MERN Stack',          100, visible),
              _chip('🔥 Firebase Expert',     200, visible),
              _chip('🤖 AI Integration',      300, visible),
              _chip('🏗️ Clean Architecture',  400, visible),
              _chip('🇵🇰 Based in Pakistan',  500, visible),
            ],
          ),

          const SizedBox(height: 32),

          // Skills preview bars (3 key skills)
          if (visible) ...[
            _MiniSkillBar('Flutter',   0.95, const Color(0xFF38BDF8), 0),
            _MiniSkillBar('Firebase',  0.90, const Color(0xFF34D399), 120),
            _MiniSkillBar('React.js',  0.85, const Color(0xFF818CF8), 240),
          ],

          const SizedBox(height: 32),

          GradientButton(
            label: 'Download CV',
            onTap: () {},
            icon: Icons.download_rounded,
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, int delayMs, bool visible) {
    return FadeInUp(
      delay: Duration(milliseconds: delayMs),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primary.withOpacity(0.3)),
        ),
        child: Text(label,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            )),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Mini skill bar shown in About section
// ─────────────────────────────────────────────────────────────
class _MiniSkillBar extends StatefulWidget {
  final String name;
  final double level;
  final Color color;
  final int delayMs;
  const _MiniSkillBar(this.name, this.level, this.color, this.delayMs);

  @override
  State<_MiniSkillBar> createState() => _MiniSkillBarState();
}

class _MiniSkillBarState extends State<_MiniSkillBar> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    Future.delayed(Duration(milliseconds: widget.delayMs), () { if (mounted) _ctrl.forward(); });
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(widget.name, style: AppTextStyles.label(13)),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: AnimatedBuilder(
                animation: _anim,
                builder: (_, __) => LinearProgressIndicator(
                  value: _anim.value * widget.level,
                  minHeight: 5,
                  backgroundColor: AppColors.border,
                  valueColor: AlwaysStoppedAnimation<Color>(widget.color),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          AnimatedBuilder(
            animation: _anim,
            builder: (_, __) => Text(
              '${(_anim.value * widget.level * 100).round()}%',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: widget.color),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
// Helper widgets
// ─────────────────────────────────────────────────────────────
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
        Expanded(child: Text(text, style: AppTextStyles.body(13), overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}