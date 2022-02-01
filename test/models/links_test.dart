import 'package:flutter_test/flutter_test.dart';
import 'package:shorten_links_app/models/links.dart';

void main() {
  test("Links constructor test", () {
    final links = Links("self", "short");

    expect(links.self, equals("self"));
    expect(links.short, equals("short"));
  });

  test("Links fromJson test", () {
    final jsonMap = {'self': "www.google.com", 'short': '/01234'};

    final links = Links.fromJson(jsonMap);

    expect(links.self == "www.google.com", true);
    expect(links.short == "/01234", true);
  });
}
