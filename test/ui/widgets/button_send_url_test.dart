import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shorten_links_app/main.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);

  testWidgets('Button send url test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byKey(const Key('mainButton')), findsOneWidget);

    await tester.tap(find.byKey(const Key('mainButton')));
    expect(find.byKey(const Key('itemListUrlCard')), findsNothing);

    await tester.enterText(
        find.byKey(const Key('mainTextField')), 'www.google.com');

    await tester.tap(find.byKey(const Key('mainButton')));
  });
}
