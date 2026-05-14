import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class TypingAnimation extends StatelessWidget {
  final List<String> texts;
  final TextStyle? style;

  const TypingAnimation({
    super.key,
    required this.texts,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: texts
          .map(
            (t) => TyperAnimatedText(
          t,
          textStyle: style ??
              AppStyles.displayMedium.copyWith(
                foreground: Paint()
                  ..shader = AppColors.primaryGrad.createShader(
                    const Rect.fromLTWH(0, 0, 400, 60),
                  ),
              ),
          speed: const Duration(milliseconds: 70),
        ),
      )
          .toList(),
    );
  }
}