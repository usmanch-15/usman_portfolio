// lib/core/widgets/particles_background.dart
// Abdullah wala ParticlesBackground — Flutter web version
// Floating dots + connecting lines + scroll parallax

import 'dart:math';
import 'package:flutter/material.dart';

class _Particle {
  double x, y, vx, vy, size, opacity;
  _Particle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.size,
    required this.opacity,
  });
}

class ParticlesBackground extends StatefulWidget {
  final Widget child;
  const ParticlesBackground({super.key, required this.child});

  @override
  State<ParticlesBackground> createState() => _ParticlesBackgroundState();
}

class _ParticlesBackgroundState extends State<ParticlesBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  final List<_Particle> _particles = [];
  final Random _rng = Random();
  static const int _count = 70;
  static const double _linkDist = 140;
  static const double _speed = 0.35;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initParticles());
  }

  void _initParticles() {
    final size = MediaQuery.of(context).size;
    _particles.clear();
    for (int i = 0; i < _count; i++) {
      final angle = _rng.nextDouble() * 2 * pi;
      _particles.add(_Particle(
        x: _rng.nextDouble() * size.width,
        y: _rng.nextDouble() * size.height,
        vx: cos(angle) * _speed * (0.5 + _rng.nextDouble() * 0.5),
        vy: sin(angle) * _speed * (0.5 + _rng.nextDouble() * 0.5),
        size: 1.0 + _rng.nextDouble() * 2.0,
        opacity: 0.4 + _rng.nextDouble() * 0.3,
      ));
    }
  }

  void _updateParticles(Size size) {
    for (final p in _particles) {
      p.x += p.vx;
      p.y += p.vy;
      if (p.x < 0) p.x = size.width;
      if (p.x > size.width) p.x = 0;
      if (p.y < 0) p.y = size.height;
      if (p.y > size.height) p.y = 0;
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _ctrl,
          builder: (context, _) {
            final size = MediaQuery.of(context).size;
            if (_particles.isEmpty) _initParticles();
            _updateParticles(size);
            return CustomPaint(
              size: size,
              painter: _ParticlesPainter(_particles, _linkDist),
            );
          },
        ),
        widget.child,
      ],
    );
  }
}

class _ParticlesPainter extends CustomPainter {
  final List<_Particle> particles;
  final double linkDist;

  _ParticlesPainter(this.particles, this.linkDist);

  @override
  void paint(Canvas canvas, Size size) {
    final dotPaint = Paint()..style = PaintingStyle.fill;
    final linePaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 0.8;

    // Draw links
    for (int i = 0; i < particles.length; i++) {
      for (int j = i + 1; j < particles.length; j++) {
        final dx = particles[i].x - particles[j].x;
        final dy = particles[i].y - particles[j].y;
        final dist = sqrt(dx * dx + dy * dy);
        if (dist < linkDist) {
          final alpha = (1 - dist / linkDist) * 0.18;
          linePaint.color = Color.fromRGBO(56, 189, 248, alpha);
          canvas.drawLine(
            Offset(particles[i].x, particles[i].y),
            Offset(particles[j].x, particles[j].y),
            linePaint,
          );
        }
      }
    }

    // Draw dots
    for (final p in particles) {
      dotPaint.color = Color.fromRGBO(56, 189, 248, p.opacity);
      canvas.drawCircle(Offset(p.x, p.y), p.size, dotPaint);
    }
  }

  @override
  bool shouldRepaint(_ParticlesPainter old) => true;
}