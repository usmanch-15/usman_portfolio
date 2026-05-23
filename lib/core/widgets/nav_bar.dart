// lib/widgets/nav_bar.dart
// Responsive navigation bar with desktop links + mobile hamburger drawer

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../utils/responsive.dart';

class NavBar extends StatefulWidget {
  final ScrollController scrollController;
  final List<GlobalKey> sectionKeys;

  const NavBar({
    super.key,
    required this.scrollController,
    required this.sectionKeys,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _scrolled = false;

  static const _navItems = [
    'Home', 'About', 'Skills', 'Services',
    'Projects', 'Experience', 'Contact',
  ];

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final scrolled = widget.scrollController.offset > 50;
    if (scrolled != _scrolled) setState(() => _scrolled = scrolled);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _scrollTo(int index) {
    if (index >= widget.sectionKeys.length) return;
    final ctx = widget.sectionKeys[index].currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(ctx,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 64,
      decoration: BoxDecoration(
        color: _scrolled
            ? AppColors.bg.withOpacity(0.95)
            : Colors.transparent,
        boxShadow: _scrolled
            ? [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 20)]
            : [],
        border: _scrolled
            ? Border(bottom: BorderSide(color: AppColors.border, width: 1))
            : null,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.horizontalPad(context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                GestureDetector(
                  onTap: () => _scrollTo(0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'U',
                          style: GoogleFonts.syne(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                        TextSpan(
                          text: 'sman',
                          style: GoogleFonts.syne(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        TextSpan(
                          text: '.',
                          style: GoogleFonts.syne(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Desktop nav links
                if (!isMobile)
                  Row(
                    children: List.generate(_navItems.length, (i) {
                      return _NavLink(
                        label: _navItems[i],
                        onTap: () => _scrollTo(i),
                      );
                    }),
                  ),

                // Mobile hamburger
                if (isMobile)
                  IconButton(
                    icon: const Icon(Icons.menu_rounded,
                        color: AppColors.textPrimary, size: 26),
                    onPressed: () => _openDrawer(context),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _MobileDrawer(
        items: _navItems,
        onTap: (i) {
          Navigator.pop(context);
          Future.delayed(
            const Duration(milliseconds: 300),
                () => _scrollTo(i),
          );
        },
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 150),
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _hovered ? AppColors.primary : AppColors.textSecond,
                ),
                child: Text(widget.label),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                height: 2,
                width: _hovered ? 24.0 : 0.0,
                margin: const EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileDrawer extends StatelessWidget {
  final List<String> items;
  final ValueChanged<int> onTap;

  const _MobileDrawer({required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: AppColors.textMuted,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          ...List.generate(items.length, (i) => ListTile(
            onTap: () => onTap(i),
            title: Text(
              items[i],
              style: GoogleFonts.spaceGrotesk(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios,
                size: 14, color: AppColors.primary),
          )),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}