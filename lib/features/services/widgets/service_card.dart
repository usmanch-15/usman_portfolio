import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_styles.dart';
import '../../../models/service_model.dart';

class ServiceCard extends StatefulWidget {
  final ServiceModel service;
  final int index;

  const ServiceCard({super.key, required this.service, this.index = 0});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final s = widget.service;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: const Color(0xFF111118),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered ? AppColors.borderGlow : AppColors.border,
          ),
          boxShadow: _hovered
              ? [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.08),
              blurRadius: 30,
              offset: const Offset(0, 16),
            )
          ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 52, height: 52,
              decoration: BoxDecoration(
                color: _hovered
                    ? AppColors.primary.withOpacity(0.2)
                    : AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                _iconFromName(s.icon),
                color: AppColors.primary,
                size: 24,
              ),
            ),

            const SizedBox(height: 20),

            Text(s.title,
                style: AppStyles.headingMedium.copyWith(fontSize: 18)),
            const SizedBox(height: 10),
            Text(s.description, style: AppStyles.bodyMedium),
          ],
        ),
      ),
    )
        .animate(delay: Duration(milliseconds: widget.index * 100))
        .fadeIn(duration: 500.ms)
        .slideY(begin: 0.3, end: 0);
  }

  IconData _iconFromName(String name) {
    switch (name) {
      case 'phone_iphone': return Icons.phone_iphone;
      case 'palette': return Icons.palette_outlined;
      case 'auto_awesome': return Icons.auto_awesome;
      case 'local_fire_department': return Icons.local_fire_department_outlined;
      case 'speed': return Icons.speed;
      case 'sync_alt': return Icons.sync_alt;
      default: return Icons.star_outline;
    }
  }
}