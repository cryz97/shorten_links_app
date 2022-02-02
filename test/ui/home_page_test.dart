import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shorten_links_app/main.dart';

void main() {
  testWidgets('Home page test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Shorten Links'), findsOneWidget);
    expect(find.byKey(const Key('mainScaffold')), findsOneWidget);
    expect(find.byKey(const Key('mainScaffoldBody')), findsOneWidget);
  });
}
