// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget Layout Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the default values are set
    expect(find.text('40'), findsOneWidget);
    expect(find.text('18'), findsOneWidget);
    expect(find.text('150.0 cm', findRichText: true), findsOneWidget);

    // Verify that widgets are laid out correctly
    expect(find.text("WEIGHT"), findsOneWidget);
    expect(find.text("AGE"), findsOneWidget);
    expect(find.text("HEIGHT"), findsOneWidget);
    expect(find.byIcon(Icons.remove), findsNWidgets(2));
    expect(find.byIcon(Icons.add), findsNWidgets(2));

    // Verify that the bmi has been displayed
    await tester.tap(find.text("CALCULATE YOUR BMI"));
    await tester.pump();
    expect(find.text("17.8"), findsOneWidget);
  });
}
