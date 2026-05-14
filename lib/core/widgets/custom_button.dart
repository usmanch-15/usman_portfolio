import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

enum ButtonVariant { primary, outline, ghost }

class CustomButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final ButtonVariant variant;
  final IconData? icon;
  final bool loading;

  const CustomButton({
    super.key,
    required this.label,
    this.onTap,
    this.variant = ButtonVariant.primary,
    this.icon,
    this.loading = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.loading ? null : widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: _decoration(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.loading)
                const SizedBox(
                  width: 16, height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              else if (widget.icon != null) ...[
                Icon(widget.icon, size: 18, color: _iconColor()),
                const SizedBox(width: 8),
              ],
              Text(widget.label, style: _textStyle()),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _decoration() {
    switch (widget.variant) {
      case ButtonVariant.primary:
        return BoxDecoration(
          gradient: _hovered
              ? const LinearGradient(
            colors: [Color(0xFF9D60FF), Color(0xFFFF5CB0)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )
              : AppColors.primaryGrad,
          borderRadius: BorderRadius.circular(12),
          boxShadow: _hovered
              ? [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 8),
            )
          ]
              : [],
        );
      case ButtonVariant.outline:
        return BoxDecoration(
          color: _hovered ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered ? AppColors.primary : AppColors.border,
          ),
        );
      case ButtonVariant.ghost:
        return BoxDecoration(
          color: _hovered ? AppColors.bgGlass : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        );
    }
  }

  Color _iconColor() {
    switch (widget.variant) {
      case ButtonVariant.primary:
        return Colors.white;
      case ButtonVariant.outline:
      case ButtonVariant.ghost:
        return _hovered ? AppColors.primary : AppColors.textSecondary;
    }
  }

  TextStyle _textStyle() {
    final color = widget.variant == ButtonVariant.primary
        ? Colors.white
        : (_hovered ? AppColors.primary : AppColors.textSecondary);
    return TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }
}