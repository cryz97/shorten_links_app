import 'package:shorten_links_app/models/links.dart';

class ShortenUrl {
  final String alias;
  final Links links;

  ShortenUrl(this.alias, this.links);

  ShortenUrl.fromJson(Map<String, dynamic> json)
      : alias = json['alias'],
        links = Links.fromJson(json['_links']);
}
