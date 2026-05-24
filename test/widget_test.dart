// test/widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usman_portfolio/main.dart';

void main() {
  testWidgets('Portfolio app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp()); // ← FIX: was MyApp
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}