import 'package:flutter_test/flutter_test.dart';
import 'package:shorten_links_app/models/links.dart';
import 'package:shorten_links_app/models/shorten_url.dart';

void main() {
  test("ShortenUrl constructor test", () {
    final shortenUrl = ShortenUrl("alias", Links("self", "short"));

    expect(shortenUrl.alias, equals('alias'));
    expect(shortenUrl.links.short.isNotEmpty, true);
    expect(shortenUrl.links.self.isNotEmpty, true);
  });

  test("ShortenUrl fromJson test", () {
    final jsonMap = {
      'alias': "01234",
      '_links': {'self': "www.google.com", 'short': "/01234"}
    };

    final shortenUrl = ShortenUrl.fromJson(jsonMap);

    expect(shortenUrl.alias == '01234', true);
    expect(shortenUrl.links.self == "www.google.com", true);
    expect(shortenUrl.links.short == "/01234", true);
  });
}
