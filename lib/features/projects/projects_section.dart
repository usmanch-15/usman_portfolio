import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';
import '../../core/utils/responsive_helper.dart';
import '../../core/widgets/section_title.dart';
import '../../data/portfolio_data.dart';
import 'widgets/hero_project_card.dart';
import 'widgets/fyp_showcase.dart';
import 'widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final padding = ResponsiveHelper.sectionPadding(context);

    final projects = PortfolioData.projects;
    final heroProject = projects.firstWhere((p) => p.id == 'cargopass');
    final fypProject = projects.firstWhere((p) => p.isFyp);
    final otherProjects =
    projects.where((p) => !p.isFyp && p.id != 'cargopass').toList();

    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            label: 'Projects',
            title: 'Things I\'ve Built',
            subtitle: 'Real products. Real users. Real impact.',
          ),

          const SizedBox(height: 60),

          // Featured: Cargoo Pass
          if (!isMobile)
            HeroProjectCard(
              project: heroProject,
              gradientColors: AppColors.projectGradients[0],
            ),

          if (!isMobile) const SizedBox(height: 24),

          // FYP Showcase
          FypShowcase(project: fypProject),

          const SizedBox(height: 24),

          // Other projects grid
          Text('More Projects',
              style: AppStyles.headingMedium.copyWith(fontSize: 20))
              .animate().fadeIn(duration: 500.ms),
          const SizedBox(height: 20),

          if (isMobile)
            Column(
              children: otherProjects
                  .asMap()
                  .entries
                  .map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ProjectCard(
                  project: e.value,
                  gradientColors: AppColors
                      .projectGradients[e.key % AppColors.projectGradients.length],
                  index: e.key,
                ),
              ))
                  .toList(),
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isTablet ? 2 : 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.72,
              ),
              itemCount: otherProjects.length,
              itemBuilder: (_, i) => ProjectCard(
                project: otherProjects[i],
                gradientColors: AppColors
                    .projectGradients[(i + 1) % AppColors.projectGradients.length],
                index: i,
              ),
            ),
        ],
      ),
    );
  }
}