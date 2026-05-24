// lib/features/contact/contact_section.dart
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';
import '../../core/widgets/common_widgets.dart';                    // SectionWrapper, SectionHeader, GlassCard
import '../../data/portfolio_data.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl    = TextEditingController();
  final _emailCtrl   = TextEditingController();
  final _subjectCtrl = TextEditingController();
  final _msgCtrl     = TextEditingController();
  bool _sending = false;
  bool _sent    = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _subjectCtrl.dispose();
    _msgCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _sending = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _sending = false;
      _sent = true;
    });
    _nameCtrl.clear();
    _emailCtrl.clear();
    _subjectCtrl.clear();
    _msgCtrl.clear();
    await Future.delayed(const Duration(seconds: 4));
    if (mounted) setState(() => _sent = false);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionWrapper(
      child: Column(
        children: [
          FadeInUp(
            child: const SectionHeader(
              badge: '✦  Contact',
              title: 'Let\'s Build Something Great',
              subtitle: 'Have a project in mind? Let\'s talk about it!',
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),

          isMobile
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: FadeInLeft(child: _buildContactInfo(context, false)),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 6,
          child: FadeInRight(child: _buildForm(context)),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        FadeInUp(child: _buildContactInfo(context, true)),
        const SizedBox(height: 32),
        FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: _buildForm(context),
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          'Get In Touch',
          style: AppTextStyles.sectionTitle(isMobile ? 22 : 26),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 12),
        Text(
          'I\'m currently available for freelance work and full-time positions. '
              'Drop me a message and I\'ll get back to you as soon as possible!',
          style: AppTextStyles.body(Responsive.bodySize(context)),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 32),
        isMobile
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _contactItems(),
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _contactItems(),
        ),
        const SizedBox(height: 32),

        // Social links
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _SocialButton(
              label: 'GitHub',
              icon: Icons.code_rounded,
              onTap: () {},
            ),
            _SocialButton(
              label: 'LinkedIn',
              icon: Icons.work_rounded,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _contactItems() => [
    _ContactItem(
        icon: Icons.email_rounded,
        label: 'Email',
        value: PortfolioData.email),
    const SizedBox(height: 16, width: 20),
    _ContactItem(
        icon: Icons.phone_rounded,
        label: 'Phone',
        value: PortfolioData.phone),
    const SizedBox(height: 16, width: 20),
    _ContactItem(
        icon: Icons.location_on_rounded,
        label: 'Location',
        value: 'Pakistan'),
  ];

  Widget _buildForm(BuildContext context) {
    if (_sent) {
      return GlassCard(
        hoverable: false,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.accentGreen.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_circle_rounded,
                  color: AppColors.accentGreen, size: 36),
            ),
            const SizedBox(height: 20),
            Text('Message Sent!', style: AppTextStyles.label(20)),
            const SizedBox(height: 8),
            Text(
              'Thank you! I\'ll get back to you within 24 hours.',
              textAlign: TextAlign.center,
              style: AppTextStyles.body(14),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    }

    return GlassCard(
      hoverable: false,
      padding: EdgeInsets.all(Responsive.isMobile(context) ? 20 : 32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name + Email row
            Responsive.isMobile(context)
                ? Column(
              children: [
                _FormField(
                  controller: _nameCtrl,
                  label: 'Full Name',
                  hint: 'John Doe',
                  icon: Icons.person_rounded,
                  validator: (v) => v!.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 16),
                _FormField(
                  controller: _emailCtrl,
                  label: 'Email Address',
                  hint: 'john@email.com',
                  icon: Icons.email_rounded,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v!.isEmpty) return 'Required';
                    if (!v.contains('@')) return 'Invalid email';
                    return null;
                  },
                ),
              ],
            )
                : Row(
              children: [
                Expanded(
                  child: _FormField(
                    controller: _nameCtrl,
                    label: 'Full Name',
                    hint: 'John Doe',
                    icon: Icons.person_rounded,
                    validator: (v) => v!.isEmpty ? 'Required' : null,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _FormField(
                    controller: _emailCtrl,
                    label: 'Email Address',
                    hint: 'john@email.com',
                    icon: Icons.email_rounded,
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) {
                      if (v!.isEmpty) return 'Required';
                      if (!v.contains('@')) return 'Invalid email';
                      return null;
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            _FormField(
              controller: _subjectCtrl,
              label: 'Subject',
              hint: 'Flutter App Development',
              icon: Icons.subject_rounded,
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),

            const SizedBox(height: 16),

            _FormField(
              controller: _msgCtrl,
              label: 'Message',
              hint: 'Tell me about your project...',
              icon: Icons.message_rounded,
              maxLines: 5,
              validator: (v) {
                if (v!.isEmpty) return 'Required';
                if (v.length < 20) return 'Too short (min 20 chars)';
                return null;
              },
            ),

            const SizedBox(height: 24),

            // Submit button
            SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: _sending ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.bg,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: _sending
                    ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: AppColors.bg,
                  ),
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.send_rounded, size: 18),
                    const SizedBox(width: 8),
                    Text('Send Message',
                        style: GoogleFonts.spaceGrotesk(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _FormField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(color: AppColors.textPrimary),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, size: 18, color: AppColors.textMuted),
        alignLabelWithHint: maxLines > 1,
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.primary.withOpacity(0.2)),
          ),
          child: Icon(icon, size: 18, color: AppColors.primary),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: AppTextStyles.body(11)),
            Text(value, style: AppTextStyles.label(13)),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _SocialButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(label,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecond,
                )),
          ],
        ),
      ),
    );
  }
}