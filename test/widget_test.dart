import 'package:flutter/material.dart'; // NOW it's needed!
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:event_explorer/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Verify app title
    expect(find.text('Event Explorer'), findsOneWidget);

    // Verify AppBar exists
    expect(find.byType(AppBar), findsOneWidget);

    // Verify search field exists
    expect(find.byType(TextField), findsOneWidget);

    // Verify bookmark button exists
    expect(find.byIcon(Icons.bookmark), findsOneWidget);
  });
}
