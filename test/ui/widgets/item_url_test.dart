import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shorten_links_app/main.dart';

void main() {
  testWidgets('Text field exists test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byKey(const Key('itemListUrlCard')), findsNothing);
  });
}
