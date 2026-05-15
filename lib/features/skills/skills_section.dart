import 'package:flutter/material.dart';
import '../../core/utils/responsive_helper.dart';
import '../../core/widgets/section_title.dart';
import '../../data/portfolio_data.dart';
import 'widgets/skill_category.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.sectionPadding(context);

    // Group skills by category
    final Map<String, List<dynamic>> grouped = {};
    for (final s in PortfolioData.skills) {
      grouped.putIfAbsent(s.category, () => []).add(s);
    }

    final categories = grouped.entries.toList();

    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            label: 'Skills',
            title: 'Skills & Expertise',
            subtitle: 'Technologies and tools I use to bring ideas to life.',
          ),
          const SizedBox(height: 60),
          if (isMobile)
            Column(
              children: categories
                  .asMap()
                  .entries
                  .map(
                    (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SkillCategory(
                    category: e.value.key,
                    skills: e.value.value.cast(),
                    delayMs: e.key * 100,
                  ),
                ),
              )
                  .toList(),
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.1,
              ),
              itemCount: categories.length,
              itemBuilder: (_, i) => SkillCategory(
                category: categories[i].key,
                skills: categories[i].value.cast(),
                delayMs: i * 100,
              ),
            ),
        ],
      ),
    );
  }
}