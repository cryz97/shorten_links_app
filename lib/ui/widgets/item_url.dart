import 'package:flutter/material.dart';
import 'package:shorten_links_app/models/shorten_url.dart';

class ItemUrl extends StatelessWidget {
  const ItemUrl({Key? key, required this.shortenUrl}) : super(key: key);

  final ShortenUrl shortenUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(shortenUrl.alias),
        title: Text(shortenUrl.links.self),
        subtitle: Text(shortenUrl.links.short),
        isThreeLine: true,
      ),
    );
  }
}
