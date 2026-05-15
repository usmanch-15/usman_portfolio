import 'package:flutter/material.dart';
import '../../core/utils/responsive_helper.dart';
import '../../core/widgets/section_title.dart';
import '../../data/portfolio_data.dart';
import 'widgets/service_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final padding = ResponsiveHelper.sectionPadding(context);
    final services = PortfolioData.services;

    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            label: 'Services',
            title: 'What I Can Do\nFor You',
            subtitle: 'From idea to app store — I handle it all.',
          ),
          const SizedBox(height: 60),
          if (isMobile)
            Column(
              children: services
                  .asMap()
                  .entries
                  .map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ServiceCard(service: e.value, index: e.key),
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
                childAspectRatio: 1.2,
              ),
              itemCount: services.length,
              itemBuilder: (_, i) =>
                  ServiceCard(service: services[i], index: i),
            ),
        ],
      ),
    );
  }
}