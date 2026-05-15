import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_styles.dart';

class HeroVisual extends StatelessWidget {
  const HeroVisual({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: {

        // ── Profile Picture ──────────────────────────────────────────────
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Glow ring behind pic
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.primaryGrad,
                ),
              ),

              // White ring
              Container(
                width: 154,
                height: 154,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF111118),
                ),
              ),

              // Profile pic
              ClipOval(
                child: Image.asset(
                  'assets/images/profile.jpg',
                  width: 148,
                  height: 148,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 148,
                    height: 148,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF1A1A2E),
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      size: 70,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),

              // Online green dot
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: const Color(0xFF22C55E),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF111118), width: 3),
                  ),
                ),
              ),
            ],
          ),
        )
            .animate(delay: 200.ms)
            .fadeIn(duration: 600.ms)
            .slideY(begin: -0.1, end: 0),

        const SizedBox(height: 24),

        // ── Code Card ────────────────────────────────────────────────────
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF111118),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.08),
                blurRadius: 60,
                offset: const Offset(0, 30),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Window bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.border)),
                ),
                child: Row(
                  children: [
                    _dot(const Color(0xFFFF5F57)),
                    const SizedBox(width: 8),
                    _dot(const Color(0xFFFEBC2E)),
                    const SizedBox(width: 8),
                    _dot(const Color(0xFF28C840)),
                    const SizedBox(width: 16),
                    const Text(
                      'usman_portfolio.dart',
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Code content
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      fontFamily: 'Courier New',
                      fontSize: 13,
                      height: 1.9,
                    ),
                    children: [
                      _kw('class '), _cl('Developer'), _kw(' {'), _nl(),
                      _sp('  '), _kw('final '), _cl('String '), _prop('name'), _t(' = '), _str("'Muhammad Usman'"), _t(';'), _nl(),
                      _sp('  '), _kw('final '), _cl('String '), _prop('role'), _t(' = '), _str("'Flutter Dev'"), _t(';'), _nl(),
                      _sp('  '), _kw('final '), _cl('int '), _prop('experience'), _t(' = '), _num('3'), _t(';'), _nl(),
                      _nl(),
                      _sp('  '), _kw('final '), _cl('List'), _t('<'), _cl('String'), _t('> '), _prop('skills'), _t(' = ['), _nl(),
                      _sp('    '), _str("'Flutter'"), _t(', '), _str("'Dart'"), _t(', '), _str("'Firebase'"), _t(','), _nl(),
                      _sp('    '), _str("'UI/UX'"), _t(', '), _str("'OpenAI'"), _t(', '), _str("'Python'"), _t(','), _nl(),
                      _sp('  '), _t('];'), _nl(),
                      _nl(),
                      _sp('  '), _cl('bool '), _fn('lovesCoding'), _t('() '), _kw('=> '), _kw('true'), _t(';'), _nl(),
                      _t('}'),
                    ],
                  ),
                ),
              ),

              // Stats row
              Container(
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: AppColors.border)),
                ),
                child: Row(
                  children: [
                    _statBox('3+', 'Years Exp'),
                    _divider(),
                    _statBox('10+', 'Projects'),
                    _divider(),
                    _statBox('4', 'Countries'),
                  ],
                ),
              ),
            ],
          ),
        )
            .animate(delay: 300.ms)
            .fadeIn(duration: 700.ms)
            .slideX(begin: 0.2, end: 0),

        const SizedBox(height: 20),

        // ── Tech Stack Chips ─────────────────────────────────────────────
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: ['Flutter', 'Firebase', 'OpenAI', 'Figma', 'Python']
              .map((t) => _techChip(t))
              .toList(),
        ).animate(delay: 500.ms).fadeIn(duration: 600.ms),
      },
    );
  }

  Widget _dot(Color color) => Container(
    width: 13,
    height: 13,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );

  Widget _statBox(String num, String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ShaderMask(
              shaderCallback: (b) => AppColors.primaryGrad.createShader(b),
              child: Text(
                num,
                style: AppStyles.headingMedium.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 4),
            Text(label,
                style: AppStyles.bodyMedium.copyWith(fontSize: 11),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _divider() =>
      Container(width: 1, height: 56, color: AppColors.border);

  Widget _techChip(String label) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.border),
      borderRadius: BorderRadius.circular(100),
      color: AppColors.bgGlass,
    ),
    child: Text(label, style: AppStyles.bodyMedium.copyWith(fontSize: 13)),
  );

  // Code text helpers
  TextSpan _kw(String t) =>
      TextSpan(text: t, style: const TextStyle(color: Color(0xFFC678DD)));
  TextSpan _cl(String t) =>
      TextSpan(text: t, style: const TextStyle(color: Color(0xFFE06C75)));
  TextSpan _fn(String t) =>
      TextSpan(text: t, style: const TextStyle(color: Color(0xFF61AFEF)));
  TextSpan _str(String t) =>
      TextSpan(text: t, style: const TextStyle(color: Color(0xFF98C379)));
  TextSpan _num(String t) =>
      TextSpan(text: t, style: const TextStyle(color: Color(0xFFD19A66)));
  TextSpan _prop(String t) =>
      TextSpan(text: t, style: const TextStyle(color: Color(0xFFABB2BF)));
  TextSpan _t(String t) =>
      TextSpan(text: t, style: const TextStyle(color: AppColors.textSecondary));
  TextSpan _sp(String t) => TextSpan(text: t);
  TextSpan _nl() => const TextSpan(text: '\n');
}