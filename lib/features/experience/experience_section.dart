import 'package:flutter/material.dart';
import '../../core/utils/responsive_helper.dart';
import '../../core/widgets/section_title.dart';
import '../../data/portfolio_data.dart';
import 'widgets/timeline_item.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = ResponsiveHelper.sectionPadding(context);
    final exps = PortfolioData.experiences;

    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            label: 'Experience',
            title: 'My Journey',
            subtitle: 'From side projects to live products across 4 countries.',
          ),
          const SizedBox(height: 60),
          ...exps.asMap().entries.map(
                (e) => TimelineItem(
              experience: e.value,
              index: e.key,
              isLast: e.key == exps.length - 1,
            ),
          ),
        ],
      ),
    );
  }
}