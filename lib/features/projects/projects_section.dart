// lib/features/projects/projects_section.dart

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/common_widgets.dart';
import '../../core/utils/url_launcher_helper.dart';
import '../../data/portfolio_data.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  bool _showAll = false;
  bool _visible = false;
  String _filter = 'All';

  static const _filters = ['All', 'Featured', 'Goflow', 'MovePk'];

  List<Map<String, dynamic>> get _filtered {
    final all = PortfolioData.projects;
    if (_filter == 'All') return all;
    if (_filter == 'Featured') return all.where((p) => p['featured'] == true).toList();
    if (_filter == 'Goflow')   return all.where((p) => (p['title'] as String).contains('Goflow')).toList();
    if (_filter == 'MovePk')   return all.where((p) => (p['title'] as String).contains('MovePk')).toList();
    return all;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final shown = _showAll ? _filtered : _filtered.sublist(0, _filtered.length.clamp(0, 6));

    return VisibilityDetector(
      key: const Key('projects-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_visible) setState(() => _visible = true);
      },
      child: Container(
        color: AppColors.bgCard,
        child: SectionWrapper(
          backgroundColor: Colors.transparent,
          child: Column(
            children: [
              FadeInUp(
                child: const SectionHeader(
                  badge: '✦  Portfolio',
                  title: 'Featured Projects',
                  subtitle: 'Real, delivered platforms — live on the Google Play Store',
                ),
              ),
              SizedBox(height: isMobile ? 32 : 48),

              // Filter tabs
              FadeInUp(
                delay: const Duration(milliseconds: 150),
                child: _FilterBar(
                  filters: _filters,
                  active: _filter,
                  onSelect: (f) => setState(() { _filter = f; _showAll = false; }),
                ),
              ),
              SizedBox(height: isMobile ? 28 : 40),

              // Grid
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                child: isMobile
                    ? _MobileList(projects: shown, visible: _visible)
                    : _DesktopGrid(projects: shown, visible: _visible, columns: isTablet ? 2 : 3),
              ),

              SizedBox(height: isMobile ? 28 : 40),

              // Show more
              if (_filtered.length > 6)
                FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  child: GradientButton(
                    label: _showAll ? 'Show Less' : 'View All ${_filtered.length} Projects',
                    onTap: () => setState(() => _showAll = !_showAll),
                    icon: _showAll ? Icons.keyboard_arrow_up_rounded : Icons.grid_view_rounded,
                    outlined: true,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Filter Bar
class _FilterBar extends StatelessWidget {
  final List<String> filters;
  final String active;
  final ValueChanged<String> onSelect;
  const _FilterBar({required this.filters, required this.active, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: filters.map((f) {
        final isActive = f == active;
        return GestureDetector(
          onTap: () => onSelect(f),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
            decoration: BoxDecoration(
              gradient: isActive ? AppColors.primaryGrad : null,
              color: isActive ? null : const Color(0xFF111827),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: isActive ? Colors.transparent : AppColors.border),
              boxShadow: isActive
                  ? [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 16)]
                  : [],
            ),
            child: Text(
              f,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: isActive ? AppColors.bg : AppColors.textSecond,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// Desktop Grid
class _DesktopGrid extends StatelessWidget {
  final List<Map<String, dynamic>> projects;
  final bool visible;
  final int columns;
  const _DesktopGrid({required this.projects, required this.visible, required this.columns});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.62,
      ),
      itemCount: projects.length,
      itemBuilder: (_, i) => FadeInUp(
        delay: Duration(milliseconds: 80 * i),
        child: _ProjectCard(project: projects[i], index: i),
      ),
    );
  }
}

// Mobile List
class _MobileList extends StatelessWidget {
  final List<Map<String, dynamic>> projects;
  final bool visible;
  const _MobileList({required this.projects, required this.visible});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(projects.length, (i) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: FadeInUp(
          delay: Duration(milliseconds: 80 * i),
          child: _ProjectCard(project: projects[i], index: i),
        ),
      )),
    );
  }
}

// Project Card
class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  final int index;
  const _ProjectCard({required this.project, required this.index});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    final color = Color(p['color'] as int);
    final techs = List<String>.from(p['tech'] as List);
    final isFeatured = p['featured'] as bool;
    final isMobile = Responsive.isMobile(context);
    final githubUrl = p['github'] as String?;
    final liveUrl = p['live'] as String?;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.identity()..translate(0.0, _hovered ? -8.0 : 0.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _hovered
                ? [color.withOpacity(0.08), const Color(0xFF111827)]
                : [const Color(0xFF1E293B), const Color(0xFF111827)],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered ? color.withOpacity(0.55) : AppColors.border,
            width: _hovered ? 1.5 : 1,
          ),
          boxShadow: _hovered
              ? [BoxShadow(color: color.withOpacity(0.2), blurRadius: 32, offset: const Offset(0, 12))]
              : [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: emoji icon + featured badge + links
              Row(
                children: [
                  Container(
                    width: 50, height: 50,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: color.withOpacity(0.3)),
                    ),
                    child: Center(child: Text(p['emoji'] as String, style: const TextStyle(fontSize: 22))),
                  ),
                  const SizedBox(width: 10),
                  if (isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: color.withOpacity(0.35)),
                      ),
                      child: Text('Featured',
                          style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.w700, color: color)),
                    ),
                  const Spacer(),
                  if (githubUrl != null) ...[
                    _IconLink(
                      icon: Icons.code_rounded,
                      tooltip: 'GitHub',
                      onTap: () => UrlLauncherHelper.openUrl(githubUrl),
                    ),
                    const SizedBox(width: 8),
                  ],
                  if (liveUrl != null)
                    _IconLink(
                      icon: Icons.open_in_new_rounded,
                      tooltip: 'View on Play Store',
                      onTap: () => UrlLauncherHelper.openUrl(liveUrl),
                    ),
                ],
              ),
              const SizedBox(height: 16),

              // Title
              Text(p['title'] as String,
                  style: GoogleFonts.syne(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 8),

              // Desc
              Text(
                p['desc'] as String,
                style: AppTextStyles.body(13),
                maxLines: isMobile ? 4 : 4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 14),

              // Accent line
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 2,
                width: _hovered ? double.infinity : 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [color, color.withOpacity(0.2)]),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 14),

              // Tech tags
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: techs.map((t) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: color.withOpacity(0.2)),
                  ),
                  child: Text(t, style: GoogleFonts.spaceGrotesk(fontSize: 10, fontWeight: FontWeight.w600, color: color)),
                )).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Icon Link Button
class _IconLink extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  const _IconLink({required this.icon, required this.tooltip, required this.onTap});

  @override
  State<_IconLink> createState() => _IconLinkState();
}

class _IconLinkState extends State<_IconLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit:  (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 34, height: 34,
            decoration: BoxDecoration(
              color: _hovered ? AppColors.primary.withOpacity(0.15) : AppColors.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: _hovered ? AppColors.primary.withOpacity(0.5) : AppColors.border),
            ),
            child: Icon(widget.icon, size: 15, color: _hovered ? AppColors.primary : AppColors.textSecond),
          ),
        ),
      ),
    );
  }
}