import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:usman_portfolio/core/constants/app_colors.dart';
import 'package:usman_portfolio/core/constants/app_styles.dart';
import 'package:usman_portfolio/features/home_page.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _animate();
  }

  void _animate() async {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 20));
      if (mounted) setState(() => _progress = i / 100);
    }
    await Future.delayed(const Duration(milliseconds: 300));
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.primaryGrad.createShader(bounds),
              child: Text(
                'USMAN.DEV',
                style: AppStyles.displayMedium.copyWith(color: Colors.white),
              ),
            )
                .animate()
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.2, end: 0),
            const SizedBox(height: 8),
            Text(
              'Flutter Developer & UI/UX Designer',
              style: AppStyles.bodyMedium,
            ).animate(delay: 200.ms).fadeIn(duration: 500.ms),
            const SizedBox(height: 48),
            SizedBox(
              width: 220,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: LinearProgressIndicator(
                      value: _progress,
                      minHeight: 2,
                      backgroundColor: AppColors.border,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${(_progress * 100).toInt()}%',
                    style: AppStyles.labelSmall,
                  ),
                ],
              ),
            ).animate(delay: 400.ms).fadeIn(duration: 400.ms),
          ],
        ),
      ),
    );
  }
}
