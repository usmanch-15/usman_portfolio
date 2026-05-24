// lib/features/projects/projects_section.dart
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/common_widgets.dart';
import '../../data/portfolio_data.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  bool _showAll = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final projects = PortfolioData.projects;
    final shown = _showAll ? projects : projects.sublist(0, 3);

    return Container(
      color: AppColors.bgCard,
      child: SectionWrapper(
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            FadeInUp(
              child: const SectionHeader(
                badge: '✦  Portfolio',
                title: 'Featured Projects',
                subtitle: 'Real-world applications built with Flutter & modern tech',
              ),
            ),
            SizedBox(height: isMobile ? 40 : 60),

            // Project cards grid
            _buildGrid(context, shown, isMobile, isTablet),

            SizedBox(height: isMobile ? 32 : 40),

            // Show more button
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: GradientButton(
                label: _showAll ? 'Show Less' : 'View All Projects',
                onTap: () => setState(() => _showAll = !_showAll),
                icon: _showAll
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.grid_view_rounded,
                outlined: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context,
      List<Map<String, dynamic>> projects, bool isMobile, bool isTablet) {
    if (isMobile) {
      return Column(
        children: List.generate(projects.length, (i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: FadeInUp(
              delay: Duration(milliseconds: 100 * i),
              child: _ProjectCard(project: projects[i]),
            ),
          );
        }),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isTablet ? 2 : 3,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: 0.82,
      ),
      itemCount: projects.length,
      itemBuilder: (context, i) => FadeInUp(
        delay: Duration(milliseconds: 100 * i),
        child: _ProjectCard(project: projects[i]),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  const _ProjectCard({required this.project});

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
    final isMobile = Responsive.isMobile(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.identity()
          ..translate(0.0, _hovered ? -6.0 : 0.0),
        decoration: BoxDecoration(
          gradient: AppColors.cardGrad,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered ? color.withOpacity(0.6) : AppColors.border,
          ),
          boxShadow: _hovered
              ? [BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 30,
            offset: const Offset(0, 12),
          )]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: color.withOpacity(0.3)),
                    ),
                    child: Center(
                      child: Text(p['emoji'] as String,
                          style: const TextStyle(fontSize: 24)),
                    ),
                  ),
                  const Spacer(),
                  // Links
                  _IconLink(
                    icon: Icons.code_rounded,
                    tooltip: 'GitHub',
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  _IconLink(
                    icon: Icons.open_in_new_rounded,
                    tooltip: 'Live Demo',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 18),

              Text(p['title'] as String, style: AppTextStyles.label(17)),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  p['desc'] as String,
                  style: AppTextStyles.body(13.5),
                  maxLines: isMobile ? null : 4,
                  overflow: isMobile ? null : TextOverflow.ellipsis,
                ),
              ),

              const SizedBox(height: 16),

              // Tech tags
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: techs
                    .map((t) => _TechTag(label: t, color: color))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TechTag extends StatelessWidget {
  final String label;
  final Color color;
  const _TechTag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Text(
        label,
        style: GoogleFonts.spaceGrotesk(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

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
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _hovered
                  ? AppColors.primary.withOpacity(0.15)
                  : AppColors.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _hovered ? AppColors.primary.withOpacity(0.5) : AppColors.border,
              ),
            ),
            child: Icon(
              widget.icon,
              size: 16,
              color: _hovered ? AppColors.primary : AppColors.textSecond,
            ),
          ),
        ),
      ),
    );
  }
}