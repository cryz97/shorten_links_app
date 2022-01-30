import 'package:flutter/material.dart';
import 'package:shorten_links_app/bloc/shorten_url_bloc.dart';
import 'package:shorten_links_app/models/shorten_url.dart';
import 'package:shorten_links_app/ui/widgets/item_url.dart';

class ListViewUrl extends StatelessWidget {
  const ListViewUrl({Key? key, required this.urlBloc}) : super(key: key);

  final ShortenUrlBloc urlBloc;
  @override
  Widget build(BuildContext context) {
    final urlList = [];
    return Expanded(
      child: StreamBuilder(
        stream: urlBloc.getUrlList,
        builder: (BuildContext context, AsyncSnapshot<ShortenUrl> snapshot) {
          if (snapshot.hasData) {
            urlList.add(snapshot.data);
          }
          return ListView.builder(
              itemCount: urlList.length,
              itemBuilder: (BuildContext context, i) {
                return ItemUrl(shortenUrl: (urlList[i]));
              });
        },
      ),
    );
  }
}
