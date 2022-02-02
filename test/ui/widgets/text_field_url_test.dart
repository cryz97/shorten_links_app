import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shorten_links_app/main.dart';

void main() {
  testWidgets('Text field exists test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byKey(const Key('mainTextField')), findsOneWidget);
  });

  testWidgets('Text field input string test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(
        find.byKey(const Key('mainTextField')), 'www.google.com');

    TextField textField =
        find.byType(TextField).evaluate().first.widget as TextField;

    expect(textField.controller?.text, "www.google.com");
  });
}
