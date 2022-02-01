import 'package:flutter_test/flutter_test.dart';
import 'package:shorten_links_app/bloc/shorten_url_bloc.dart';

void main() {
  test("Add alias to stream", () async {
    ShortenUrlBloc urlBloc = ShortenUrlBloc();
    urlBloc.addUrlAlias("www.google.com");
    expect(await urlBloc.getUrlList.isEmpty, false);
  });

  test("Get stream values", () async {
    ShortenUrlBloc urlBloc = ShortenUrlBloc();
    urlBloc.addUrlAlias("www.google.com");
    expect(
        await urlBloc.getUrlList.first
            .then((value) => value.links.self == 'www.google.com'),
        true);
  });
}
