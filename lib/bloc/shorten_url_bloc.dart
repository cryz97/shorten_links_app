import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:shorten_links_app/models/shorten_url.dart';
import 'package:shorten_links_app/services/shorten_url_service.dart';

class ShortenUrlBloc {
  late final http.Client httpClient;
  ShortenUrlBloc() {
    httpClient = http.Client();
  }

  final StreamController<ShortenUrl> shortenUrlStream =
      StreamController<ShortenUrl>();
  Stream<ShortenUrl> get getUrlList => shortenUrlStream.stream;

  void addUrlAlias(String url) async {
    ShortenUrl newUrlAlias =
        await ShortenUrlService.createUrlAlias(url, httpClient);
    shortenUrlStream.sink.add(newUrlAlias);
  }
}
