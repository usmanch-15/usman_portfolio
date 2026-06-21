// lib/features/research/research_section.dart
// Research Paper section — Zenodo published paper

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/url_launcher_helper.dart';
import '../../core/widgets/common_widgets.dart';

class ResearchSection extends StatelessWidget {
  const ResearchSection({super.key});

  static const _paper = {
    'title':
    'Security Vulnerabilities in MERN-Flutter Applications: A Comprehensive Analysis',
    'journal': 'Zenodo',
    'doi': '10.5281/zenodo.20636215',
    'doiUrl': 'https://doi.org/10.5281/zenodo.20636215',
    'year': '2025',
    'abstract':
    'This paper presents a comprehensive analysis of security vulnerabilities in hybrid applications built using MERN stack (MongoDB, Express.js, React, Node.js) with Flutter frontends. We examine common attack vectors including SQL injection, cross-site scripting, insecure API endpoints, and improper authentication mechanisms, providing practical mitigation strategies for developers.',
    'tags': [
      'Flutter',
      'MERN Stack',
      'Security',
      'Vulnerability Analysis',
      'Mobile Security',
      'API Security',
    ],
  };

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionWrapper(
      child: Column(
        children: [
          const SectionHeader(
            badge: '✦  Research',
            title: 'Published Research',
            subtitle: 'Academic contributions to mobile & web security',
          ),
          SizedBox(height: isMobile ? 40 : 60),

          _PaperCard(paper: _paper, isMobile: isMobile)
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.2, end: 0),
        ],
      ),
    );
  }
}

class _PaperCard extends StatefulWidget {
  final Map<String, dynamic> paper;
  final bool isMobile;

  const _PaperCard({required this.paper, required this.isMobile});

  @override
  State<_PaperCard> createState() => _PaperCardState();
}

class _PaperCardState extends State<_PaperCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.paper;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          gradient: AppColors.cardGrad,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered
                ? AppColors.primary.withOpacity(0.5)
                : AppColors.border,
          ),
          boxShadow: _hovered
              ? [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.10),
              blurRadius: 30,
              offset: const Offset(0, 10),
            )
          ]
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: widget.isMobile
            ? _buildMobile(p)
            : _buildDesktop(p),
      ),
    );
  }

  Widget _buildDesktop(Map<String, dynamic> p) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left — icon
        _PaperIcon(),
        const SizedBox(width: 32),
        // Right — content
        Expanded(child: _PaperContent(paper: p)),
      ],
    );
  }

  Widget _buildMobile(Map<String, dynamic> p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PaperIcon(),
        const SizedBox(height: 20),
        _PaperContent(paper: p),
      ],
    );
  }
}

class _PaperIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGrad,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: const Icon(
        Icons.article_rounded,
        size: 36,
        color: Color(0xFF0A0E1A),
      ),
    );
  }
}

class _PaperContent extends StatelessWidget {
  final Map<String, dynamic> paper;
  const _PaperContent({required this.paper});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Journal + year badge
        Row(
          children: [
            _badge(paper['journal'] as String),
            const SizedBox(width: 10),
            _badge(paper['year'] as String, isYear: true),
          ],
        ),
        const SizedBox(height: 14),

        // Title
        Text(
          paper['title'] as String,
          style: AppTextStyles.label(18),
        ),
        const SizedBox(height: 14),

        // Abstract
        Text(
          paper['abstract'] as String,
          style: AppTextStyles.body(14),
        ),
        const SizedBox(height: 20),

        // Tags
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: (paper['tags'] as List<String>)
              .map((t) => _tag(t))
              .toList(),
        ),
        const SizedBox(height: 24),

        // DOI + Button
        Row(
          children: [
            // DOI text
            Flexible(
              child: Text(
                'DOI: ${paper['doi']}',
                style: AppTextStyles.badge(12),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 16),
            // View button
            GestureDetector(
              onTap: () =>
                  UrlLauncherHelper.openUrl(paper['doiUrl'] as String),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGrad,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.open_in_new_rounded,
                          size: 16, color: Color(0xFF0A0E1A)),
                      const SizedBox(width: 6),
                      Text(
                        'View Paper',
                        style: AppTextStyles.label(13).copyWith(
                          color: const Color(0xFF0A0E1A),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _badge(String label, {bool isYear = false}) => Container(
    padding:
    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    decoration: BoxDecoration(
      color: isYear
          ? AppColors.accent.withOpacity(0.12)
          : AppColors.primary.withOpacity(0.12),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: isYear
            ? AppColors.accent.withOpacity(0.4)
            : AppColors.primary.withOpacity(0.4),
      ),
    ),
    child: Text(
      label,
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: isYear ? AppColors.accent : AppColors.primary,
      ),
    ),
  );

  Widget _tag(String label) => Container(
    padding:
    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: AppColors.bgGlass,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.border),
    ),
    child: Text(
      label,
      style: AppTextStyles.body(12).copyWith(
        color: AppColors.textSecondary,
      ),
    ),
  );
}