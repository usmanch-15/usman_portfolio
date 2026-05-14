import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class MobileDrawer extends StatelessWidget {
  final void Function(int index) onNavTap;
  const MobileDrawer({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0F0F18),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (b) => AppColors.primaryGrad.createShader(b),
                child: const Text(
                  'USMAN.DEV',
                  style: TextStyle(
                    fontFamily: 'ClashDisplay',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ...List.generate(AppStrings.navItems.length, (i) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    AppStrings.navItems[i],
                    style: const TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 18,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    onNavTap(i);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}