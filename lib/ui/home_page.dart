import 'package:flutter/material.dart';
import 'package:shorten_links_app/bloc/shorten_url_bloc.dart';
import 'package:shorten_links_app/ui/widgets/input_url_row.dart';
import 'package:shorten_links_app/ui/widgets/list_view_url.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final urlBloc = ShortenUrlBloc();
    return Scaffold(
        key: const Key('mainScaffold'),
        appBar: AppBar(
          title: const Text("Shorten Links"),
        ),
        body: Column(
          key: const Key('mainScaffoldBody'),
          children: [
            InputRow(
              urlBloc: urlBloc,
            ),
            Expanded(
              child: ListViewUrl(
                urlBloc: urlBloc,
              ),
            )
          ],
        ));
  }
}
