import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/loading/loading_screen.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muhammad Usman | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const LoadingScreen(),
    );
  }
}