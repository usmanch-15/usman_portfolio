// lib/features/skills/skills_section.dart
// Skills section — exact same card style as Projects section

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/common_widgets.dart';
import '../../data/portfolio_data.dart';

// ── Skill card data ──────────────────────────────────────────────────────────
class _SkillCard {
  final String emoji;
  final String title;
  final String desc;
  final int color;
  final List<String> tags;
  const _SkillCard({
    required this.emoji,
    required this.title,
    required this.desc,
    required this.color,
    required this.tags,
  });
}

const _skillCards = [
  _SkillCard(
    emoji: '📱',
    title: 'Flutter & Dart',
    desc: 'Expert-level cross-platform development with custom widgets, smooth animations, and pixel-perfect UI for iOS, Android & Web.',
    color: 0xFF38BDF8,
    tags: ['Flutter', 'Dart', 'Custom Widgets', 'Animations', 'Responsive UI'],
  ),
  _SkillCard(
    emoji: '🔥',
    title: 'Firebase & Backend',
    desc: 'Full Firebase stack — Auth, Firestore, Storage, Cloud Functions, FCM push notifications and real-time data sync.',
    color: 0xFFFB923C,
    tags: ['Firebase', 'Firestore', 'Cloud Functions', 'FCM', 'Auth'],
  ),
  _SkillCard(
    emoji: '🔗',
    title: 'REST APIs & Networking',
    desc: 'Seamless backend integration with Dio, Retrofit, JSON parsing, interceptors, caching, and robust error handling.',
    color: 0xFF34D399,
    tags: ['REST API', 'Dio', 'Retrofit', 'JSON', 'Interceptors'],
  ),
  _SkillCard(
    emoji: '⚡',
    title: 'State Management',
    desc: 'Production-grade state with GetX, Riverpod, Provider and BLoC. Clean architecture with Repository Pattern.',
    color: 0xFF818CF8,
    tags: ['GetX', 'Riverpod', 'Provider', 'BLoC', 'Clean Arch'],
  ),
  _SkillCard(
    emoji: '🤖',
    title: 'AI Integration',
    desc: 'Integrating ChatGPT, Gemini, and custom ML models into mobile apps for intelligent, context-aware features.',
    color: 0xFFA78BFA,
    tags: ['OpenAI', 'Gemini', 'ML Kit', 'TensorFlow Lite', 'NLP'],
  ),
  _SkillCard(
    emoji: '🗄️',
    title: 'Database & Storage',
    desc: 'Offline-first apps with SQLite, Hive, Shared Preferences. Fast local persistence with zero cold-start lag.',
    color: 0xFF4ADE80,
    tags: ['SQLite', 'Hive', 'SharedPrefs', 'Encrypted Storage', 'Caching'],
  ),
];

// ── Skill bar data ───────────────────────────────────────────────────────────
class _BarItem {
  final String name;
  final double level;
  final String badge;
  final Color color;
  const _BarItem(this.name, this.level, this.badge, this.color);
}

const _bars = [
  _BarItem('Flutter & Dart',     0.95, 'Expert',     Color(0xFF38BDF8)),
  _BarItem('Firebase',           0.90, 'Expert',     Color(0xFFFB923C)),
  _BarItem('State Management',   0.92, 'Expert',     Color(0xFF818CF8)),
  _BarItem('REST API & Dio',     0.88, 'Advanced',   Color(0xFF34D399)),
  _BarItem('UI/UX & Animations', 0.85, 'Advanced',   Color(0xFFF472B6)),
  _BarItem('AI Integration',     0.80, 'Advanced',   Color(0xFFA78BFA)),
  _BarItem('SQLite / Hive',      0.82, 'Advanced',   Color(0xFF4ADE80)),
  _BarItem('Git & GitHub',       0.90, 'Expert',     Color(0xFFE2E8F0)),
  _BarItem('GetX / Riverpod',    0.88, 'Advanced',   Color(0xFF38BDF8)),
  _BarItem('App Optimization',   0.87, 'Advanced',   Color(0xFFFBBF24)),
  _BarItem('Push Notifications', 0.85, 'Advanced',   Color(0xFFFC8181)),
  _BarItem('CI/CD & Deployment', 0.78, 'Proficient', Color(0xFF68D391)),
];

// ── Main Section ─────────────────────────────────────────────────────────────
class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});
  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with TickerProviderStateMixin {
  bool _visible = false;
  bool _showAll = false;
  late final AnimationController _barCtrl;
  late final List<Animation<double>> _barAnims;

  @override
  void initState() {
    super.initState();
    _barCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    _barAnims = List.generate(_bars.length, (i) {
      final start = (i * 0.06).clamp(0.0, 0.6);
      final end   = (start + 0.4).clamp(0.0, 1.0);
      return Tween<double>(begin: 0, end: _bars[i].level).animate(
        CurvedAnimation(
          parent: _barCtrl,
          curve: Interval(start, end, curve: Curves.easeOutCubic),
        ),
      );
    });
  }

  @override
  void dispose() {
    _barCtrl.dispose();
    super.dispose();
  }

  void _onVisible() {
    if (_visible) return;
    setState(() => _visible = true);
    _barCtrl.forward();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile  = Responsive.isMobile(context);
    final isTablet  = Responsive.isTablet(context);
    final shown     = _showAll ? _skillCards : _skillCards.sublist(0, 3);

    return VisibilityDetector(
      key: const Key('skills-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.10) _onVisible();
      },
      child: Container(
        color: AppColors.bgCard,
        child: SectionWrapper(
          backgroundColor: Colors.transparent,
          child: Column(
            children: [
              // ── Header ───────────────────────────────────────────
              FadeInUp(
                child: const SectionHeader(
                  badge: '✦  Skills',
                  title: 'My Technical Arsenal',
                  subtitle: 'Technologies I work with daily to build production-grade apps',
                ),
              ),
              SizedBox(height: isMobile ? 40 : 60),

              // ── Skill Cards Grid (same as projects) ───────────────
              _buildGrid(context, shown, isMobile, isTablet),
              SizedBox(height: isMobile ? 24 : 32),

              // Show more button
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: GradientButton(
                  label: _showAll ? 'Show Less' : 'View All Skills',
                  onTap: () => setState(() => _showAll = !_showAll),
                  icon: _showAll
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.grid_view_rounded,
                  outlined: true,
                ),
              ),
              SizedBox(height: isMobile ? 48 : 72),

              // ── Proficiency Bars ──────────────────────────────────
              FadeInUp(
                child: Row(
                  children: [
                    Container(
                      width: 4, height: 24,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGrad,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text('Proficiency Levels', style: AppTextStyles.label(18)),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              FadeInUp(
                delay: const Duration(milliseconds: 100),
                child: Text(
                  'Years of hands-on experience across each technology',
                  style: AppTextStyles.body(13)
                      .copyWith(color: AppColors.textSecond),
                ),
              ),
              const SizedBox(height: 32),

              isMobile
                  ? Column(
                children: List.generate(_bars.length, (i) =>
                    _SkillBar(item: _bars[i], anim: _barAnims[i]),
                ),
              )
                  : _buildBarsGrid(),

              SizedBox(height: isMobile ? 48 : 72),

              // ── Tech Stack ────────────────────────────────────────
              FadeInUp(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 4, height: 24,
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGrad,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text('Tech Stack & Tools', style: AppTextStyles.label(18)),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: PortfolioData.techStack
                          .map((t) => _TechChip(label: t))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Same grid logic as ProjectsSection
  Widget _buildGrid(BuildContext context,
      List<_SkillCard> cards, bool isMobile, bool isTablet) {
    if (isMobile) {
      return Column(
        children: List.generate(cards.length, (i) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: FadeInUp(
            delay: Duration(milliseconds: 100 * i),
            child: _SkillCardWidget(card: cards[i]),
          ),
        )),
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isTablet ? 2 : 3,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        mainAxisExtent: 320,
      ),
      itemCount: cards.length,
      itemBuilder: (context, i) => FadeInUp(
        delay: Duration(milliseconds: 100 * i),
        child: _SkillCardWidget(card: cards[i]),
      ),
    );
  }

  Widget _buildBarsGrid() {
    final half = (_bars.length / 2).ceil();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: List.generate(half, (i) =>
                _SkillBar(item: _bars[i], anim: _barAnims[i]),
            ),
          ),
        ),
        const SizedBox(width: 48),
        Expanded(
          child: Column(
            children: List.generate(_bars.length - half, (i) =>
                _SkillBar(item: _bars[i + half], anim: _barAnims[i + half]),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Skill Card Widget — exact same as _ProjectCard ────────────────────────────
class _SkillCardWidget extends StatefulWidget {
  final _SkillCard card;
  const _SkillCardWidget({required this.card});
  @override
  State<_SkillCardWidget> createState() => _SkillCardWidgetState();
}

class _SkillCardWidgetState extends State<_SkillCardWidget> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final c     = widget.card;
    final color = Color(c.color);
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row — emoji icon + links
              Row(
                children: [
                  // Icon box — exact same as projects
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: 52, height: 52,
                    decoration: BoxDecoration(
                      color: color.withOpacity(_hovered ? 0.18 : 0.12),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: color.withOpacity(0.3)),
                      boxShadow: _hovered
                          ? [BoxShadow(color: color.withOpacity(0.3), blurRadius: 12)]
                          : [],
                    ),
                    child: Center(
                      child: Text(c.emoji, style: const TextStyle(fontSize: 24)),
                    ),
                  ),
                  const Spacer(),
                  // GitHub & Live icons (same as projects)
                  _IconBtn(icon: Icons.code_rounded,       tooltip: 'GitHub'),
                  const SizedBox(width: 8),
                  _IconBtn(icon: Icons.open_in_new_rounded, tooltip: 'Details'),
                ],
              ),

              const SizedBox(height: 18),

              Text(c.title, style: AppTextStyles.label(17)),
              const SizedBox(height: 8),
              Text(
                c.desc,
                style: AppTextStyles.body(13.5),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 16),

              // Tech tags — exact same as projects
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: c.tags
                    .map((t) => _TagChip(label: t, color: color))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Skill Bar ─────────────────────────────────────────────────────────────────
class _SkillBar extends StatelessWidget {
  final _BarItem item;
  final Animation<double> anim;
  const _SkillBar({required this.item, required this.anim});

  Color get _badgeColor {
    if (item.level >= 0.90) return const Color(0xFF38BDF8);
    if (item.level >= 0.82) return const Color(0xFF818CF8);
    return const Color(0xFF34D399);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: AnimatedBuilder(
        animation: anim,
        builder: (_, __) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.name, style: AppTextStyles.label(13)),
                Row(
                  children: [
                    Text(
                      '${(anim.value * 100).round()}%',
                      style: AppTextStyles.badge(12),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: _badgeColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: _badgeColor.withOpacity(0.35)),
                      ),
                      child: Text(
                        item.badge,
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: _badgeColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(3),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: anim.value,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [item.color.withOpacity(0.6), item.color],
                    ),
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: item.color.withOpacity(0.5),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Tag Chip — exact same style as projects _TechTag ──────────────────────────
class _TagChip extends StatelessWidget {
  final String label;
  final Color color;
  const _TagChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.10),
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

// ── Tech Chip ─────────────────────────────────────────────────────────────────
class _TechChip extends StatefulWidget {
  final String label;
  const _TechChip({required this.label});
  @override
  State<_TechChip> createState() => _TechChipState();
}

class _TechChipState extends State<_TechChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..translate(0.0, _hovered ? -4.0 : 0.0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.primary.withOpacity(0.10)
              : AppColors.bgGlass,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _hovered
                ? AppColors.primary.withOpacity(0.5)
                : AppColors.border,
          ),
          boxShadow: _hovered
              ? [BoxShadow(
            color: AppColors.primary.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )]
              : [],
        ),
        child: Text(
          widget.label,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: _hovered ? AppColors.primary : AppColors.textSecond,
          ),
        ),
      ),
    );
  }
}

// ── Icon Button ───────────────────────────────────────────────────────────────
class _IconBtn extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  const _IconBtn({required this.icon, required this.tooltip});
  @override
  State<_IconBtn> createState() => _IconBtnState();
}

class _IconBtnState extends State<_IconBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit:  (_) => setState(() => _hovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 36, height: 36,
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.primary.withOpacity(0.15)
                : AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered
                  ? AppColors.primary.withOpacity(0.5)
                  : AppColors.border,
            ),
          ),
          child: Icon(
            widget.icon,
            size: 16,
            color: _hovered ? AppColors.primary : AppColors.textSecond,
          ),
        ),
      ),
    );
  }
}