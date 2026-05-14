import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/utils/responsive_helper.dart';
import 'mobile_drawer.dart';

class NavbarWidget extends StatefulWidget {
  final void Function(int index) onNavTap;
  const NavbarWidget({super.key, required this.onNavTap});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  int _active = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          height: 72,
          decoration: const BoxDecoration(
            color: Color(0xCC0A0A0F),
            border: Border(
              bottom: BorderSide(color: AppColors.border, width: 1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                ShaderMask(
                  shaderCallback: (b) => AppColors.primaryGrad.createShader(b),
                  child: const Text(
                    'USMAN.DEV',
                    style: TextStyle(
                      fontFamily: 'ClashDisplay',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const Spacer(),
                if (!isMobile) ...[
                  ...List.generate(AppStrings.navItems.length, (i) {
                    final active = _active == i;
                    return Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            setState(() => _active = i);
                            widget.onNavTap(i);
                          },
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 200),
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: active
                                  ? AppColors.primary
                                  : AppColors.textSecondary,
                            ),
                            child: Text(AppStrings.navItems[i]),
                          ),
                        ),
                      ),
                    );
                  }),
                ] else ...[
                  IconButton(
                    icon: const Icon(Icons.menu_rounded,
                        color: AppColors.textPrimary),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}