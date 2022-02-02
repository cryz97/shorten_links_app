import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shorten_links_app/bloc/shorten_url_bloc.dart';
import 'package:shorten_links_app/main.dart';
import 'package:shorten_links_app/models/links.dart';
import 'package:shorten_links_app/models/shorten_url.dart';
import 'package:shorten_links_app/ui/widgets/list_view_url.dart';

void main() {
  testWidgets('StreamBuilder exists test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byKey(const Key('mainStreamBuilder')), findsOneWidget);
  });

  testWidgets('StreamBuilder add items test', (WidgetTester tester) async {
    final ShortenUrlBloc urlBloc = ShortenUrlBloc();
    var app = MaterialApp(
        home: SizedBox(height: 800, child: ListViewUrl(urlBloc: urlBloc)));

    await tester.pumpWidget(app);

    urlBloc.shortenUrlStream.sink
        .add(ShortenUrl('01234', Links('www.google.com', '/01234')));

    await tester.idle();
    await tester.pump(Duration.zero);

    expect(find.byKey(const Key('itemListUrlCard')), findsOneWidget);
  });
}
