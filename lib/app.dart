// lib/app.dart
// System theme (dark/light auto), scroll progress, cursor glow

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_fonts/google_fonts.dart';
import 'core/constants/app_colors.dart';
import 'core/theme/app_theme.dart';
import 'features/loading/loading_screen.dart';

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muhammad Usman | Flutter & MERN Stack Developer',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,   // ← auto system theme
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: kIsWeb
          ? const _WebWrapper(child: LoadingScreen())
          : const LoadingScreen(),
    );
  }
}

// ── Web wrapper: scroll progress bar + custom cursor glow ──
class _WebWrapper extends StatefulWidget {
  final Widget child;
  const _WebWrapper({required this.child});

  @override
  State<_WebWrapper> createState() => _WebWrapperState();
}

class _WebWrapperState extends State<_WebWrapper> {
  double _scrollProgress = 0;
  Offset _cursor = Offset.zero;
  bool _cursorVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return NotificationListener<ScrollNotification>(
      onNotification: (n) {
        if (n.metrics.maxScrollExtent > 0) {
          setState(() => _scrollProgress =
              n.metrics.pixels / n.metrics.maxScrollExtent);
        }
        return false;
      },
      child: MouseRegion(
        onHover: (e) => setState(() {
          _cursor = e.localPosition;
          _cursorVisible = true;
        }),
        onExit: (_) => setState(() => _cursorVisible = false),
        child: Stack(
          children: [
            widget.child,

            // ── Custom cursor glow ──
            if (_cursorVisible)
              Positioned(
                left: _cursor.dx - 20,
                top: _cursor.dy - 20,
                child: IgnorePointer(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.primary.withOpacity(0.18),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            // ── Scroll progress bar ──
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: _scrollProgress,
                child: Container(
                  height: 2.5,
                  decoration: const BoxDecoration(
                    gradient: AppColors.primaryGrad,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}