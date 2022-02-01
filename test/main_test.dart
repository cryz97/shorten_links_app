import 'package:flutter_test/flutter_test.dart';
import 'package:shorten_links_app/main.dart';

void main() {
  testWidgets('Build app test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
  });
}
