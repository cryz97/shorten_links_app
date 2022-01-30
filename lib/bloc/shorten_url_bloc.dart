import 'dart:async';

import 'package:shorten_links_app/models/shorten_url.dart';
import 'package:shorten_links_app/services/shorten_url_service.dart';

class ShortenUrlBloc {
  final StreamController<ShortenUrl> shortenUrlStream =
      StreamController<ShortenUrl>();
  Stream<ShortenUrl> get getUrlList => shortenUrlStream.stream;

  void addUrlAlias(String url) async {
    ShortenUrl newUrlAlias = await ShortenUrlService.createUrlAlias(url);
    shortenUrlStream.sink.add(newUrlAlias);
  }
}
