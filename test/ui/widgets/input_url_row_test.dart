import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shorten_links_app/main.dart';

void main() {
  testWidgets('Input row test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byKey(const Key('RowTop')), findsOneWidget);
  });
}
