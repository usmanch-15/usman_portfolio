// lib/core/utils/project_mockup_helper.dart
// Generates beautiful gradient mockup cards for projects that have no screenshot
// Use this in ProjectCard: ProjectMockupHelper.buildMockup(title, emoji, color)

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class ProjectMockupHelper {
  /// Returns a styled mockup widget for a project card
  static Widget buildMockup({
    required String title,
    required String emoji,
    required Color accentColor,
    double height = 160,
  }) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accentColor.withOpacity(0.15),
            const Color(0xFF0A0E1A),
          ],
        ),
        border: Border(
          bottom: BorderSide(color: accentColor.withOpacity(0.2)),
        ),
      ),
      child: Stack(
        children: [
          // Grid pattern overlay
          CustomPaint(
            size: Size(double.infinity, height),
            painter: _GridMockupPainter(accentColor),
          ),

          // Floating "phone" frame
          Center(
            child: Container(
              width: 80,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF111827),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: accentColor.withOpacity(0.4), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withOpacity(0.25),
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(emoji, style: const TextStyle(fontSize: 28)),
                  const SizedBox(height: 8),
                  // Fake "screen bars"
                  _bar(accentColor, 0.7),
                  const SizedBox(height: 4),
                  _bar(accentColor, 0.5),
                  const SizedBox(height: 4),
                  _bar(accentColor, 0.6),
                ],
              ),
            ),
          ),

          // Top left — "LIVE" badge for featured projects
          Positioned(
            top: 10, left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: accentColor.withOpacity(0.35)),
              ),
              child: Text('Preview',
                  style: GoogleFonts.spaceGrotesk(
                      fontSize: 9, fontWeight: FontWeight.w700, color: accentColor)),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _bar(Color c, double widthFactor) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Container(
        height: 3,
        decoration: BoxDecoration(
          color: c.withOpacity(0.3),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _GridMockupPainter extends CustomPainter {
  final Color color;
  _GridMockupPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.04)
      ..strokeWidth = 1;
    const step = 24.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_) => false;
}