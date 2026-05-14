import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../core/utils/scroll_controller.dart';
import '../core/widgets/animated_gradient_bg.dart';
import 'navbar/navbar_widget.dart';
import 'hero/hero_section.dart';
import 'about/about_section.dart';
import 'skills/skills_section.dart';
import 'experience/experience_section.dart';
import 'projects/projects_section.dart';
import 'services/services_section.dart';
import 'contact/contact_section.dart';
import 'footer/footer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(72),
        child: NavbarWidget(
          onNavTap: (index) =>
              PortfolioScrollController.scrollToSection(index),
        ),
      ),
      body: AnimatedGradientBg(
        child: SingleChildScrollView(
          controller: PortfolioScrollController.controller,
          child: Column(
            children: [
              _section(0, const HeroSection()),
              _section(1, const AboutSection()),
              _section(2, const SkillsSection()),
              _section(3, const ExperienceSection()),
              _section(4, const ProjectsSection()),
              _section(5, const ServicesSection()),
              _section(6, const ContactSection()),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _section(int index, Widget child) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: PortfolioScrollController.controller,
      index: index,
      child: child,
    );
  }
}