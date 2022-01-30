import 'package:shorten_links_app/models/shorten_url.dart';
import 'package:shorten_links_app/services/shorten_url_service.dart';

class ShortenUrlBloc {
  Stream<List<ShortenUrl>> addShortenUrl(String url) async* {
    final List<ShortenUrl> shortenUrlList = [];
    ShortenUrl newUrlAlias = await ShortenUrlService.createUrlAlias(url);
    shortenUrlList.add(newUrlAlias);
    yield shortenUrlList;
  }
}
