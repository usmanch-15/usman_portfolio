import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../../core/widgets/custom_button.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _msgCtrl = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _msgCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_nameCtrl.text.isEmpty ||
        _emailCtrl.text.isEmpty ||
        _msgCtrl.text.isEmpty) return;

    setState(() => _loading = true);
    await Future.delayed(const Duration(milliseconds: 800));

    final subject = 'Portfolio Inquiry from ${_nameCtrl.text}';
    final body =
        'From: ${_nameCtrl.text}\nEmail: ${_emailCtrl.text}\n\n${_msgCtrl.text}';

    await UrlLauncherHelper.sendEmail(
      AppStrings.email,
      subject: subject,
      body: body,
    );

    if (mounted) {
      setState(() => _loading = false);
      _nameCtrl.clear();
      _emailCtrl.clear();
      _msgCtrl.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Message sent! 🎉'),
          backgroundColor: AppColors.primary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Send a Message',
            style: AppStyles.headingMedium.copyWith(fontSize: 20)),
        const SizedBox(height: 24),

        // Name
        _field(
          controller: _nameCtrl,
          label: 'Your Name',
          hint: 'Muhammad Ali',
          icon: Icons.person_outline,
        ),
        const SizedBox(height: 16),

        // Email
        _field(
          controller: _emailCtrl,
          label: 'Email Address',
          hint: 'hello@example.com',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),

        // Message
        _field(
          controller: _msgCtrl,
          label: 'Message',
          hint: 'Tell me about your project...',
          icon: Icons.message_outlined,
          maxLines: 5,
        ),
        const SizedBox(height: 24),

        SizedBox(
          width: double.infinity,
          child: CustomButton(
            label: 'Send Message',
            icon: Icons.send_rounded,
            onTap: _submit,
            loading: _loading,
          ),
        ),
      ],
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppStyles.bodyMedium
                .copyWith(fontSize: 13, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: AppStyles.bodyMedium.copyWith(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppStyles.bodyMedium,
            prefixIcon: maxLines == 1
                ? Icon(icon, size: 18, color: AppColors.textSecondary)
                : null,
            filled: true,
            fillColor: AppColors.bgGlass,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 18, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}