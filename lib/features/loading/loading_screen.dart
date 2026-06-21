// lib/features/loading/loading_screen.dart
// Pro-level loading screen — animated logo, typewriter, progress bar + counter

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../home_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  double _progress = 0;
  int _percent = 0;
  int _charIndex = 0;
  final String _title = 'USMAN.DEV';
  late AnimationController _glowCtrl;
  late Animation<double> _glow;

  @override
  void initState() {
    super.initState();

    // Glow pulse on logo
    _glowCtrl = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
    _glow = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _glowCtrl, curve: Curves.easeInOut),
    );

    _runSequence();
  }

  void _runSequence() async {
    // Step 1: typewriter — one char every 80ms
    for (int i = 1; i <= _title.length; i++) {
      await Future.delayed(const Duration(milliseconds: 80));
      if (mounted) setState(() => _charIndex = i);
    }
    await Future.delayed(const Duration(milliseconds: 200));

    // Step 2: progress bar 0 → 100
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 18));
      if (mounted) setState(() { _progress = i / 100; _percent = i; });
    }
    await Future.delayed(const Duration(milliseconds: 400));

    // Step 3: navigate
    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomePage(),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    }
  }

  @override
  void dispose() {
    _glowCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayed = _title.substring(0, _charIndex);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          // Background grid dots
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
            painter: _GridPainter(),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo with glow
                AnimatedBuilder(
                  animation: _glow,
                  builder: (_, __) => ShaderMask(
                    shaderCallback: (b) => AppColors.primaryGrad.createShader(b),
                    child: Text(
                      displayed,
                      style: GoogleFonts.syne(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: AppColors.primary.withOpacity(_glow.value * 0.8),
                            blurRadius: 40 * _glow.value,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                // Subtitle
                Text(
                  'Flutter & MERN Stack Developer',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 13,
                    color: AppColors.textSecond,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                  ),
                ).animate(delay: 800.ms).fadeIn(duration: 500.ms),

                const SizedBox(height: 56),

                // Progress bar
                SizedBox(
                  width: 260,
                  child: Column(
                    children: [
                      // Bar
                      Container(
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppColors.border,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: _progress,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryGrad,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.6),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // Percent + loading text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _loadingText(_percent),
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 11,
                              color: AppColors.textMuted,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          ShaderMask(
                            shaderCallback: (b) => AppColors.primaryGrad.createShader(b),
                            child: Text(
                              '$_percent%',
                              style: GoogleFonts.syne(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ).animate(delay: 900.ms).fadeIn(duration: 400.ms),
              ],
            ),
          ),

          // Bottom corner — Pakistan 🇵🇰
          Positioned(
            bottom: 28,
            right: 28,
            child: Text(
              'Pakistan 🇵🇰',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 12,
                color: AppColors.textMuted,
              ),
            ).animate(delay: 1000.ms).fadeIn(duration: 500.ms),
          ),
        ],
      ),
    );
  }

  String _loadingText(int p) {
    if (p < 20) return 'Initializing...';
    if (p < 45) return 'Loading assets...';
    if (p < 70) return 'Building UI...';
    if (p < 90) return 'Almost ready...';
    return 'Launching portfolio...';
  }
}

// Subtle dot-grid background painter
class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1E293B).withOpacity(0.5)
      ..strokeWidth = 1;
    const spacing = 32.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_) => false;
}