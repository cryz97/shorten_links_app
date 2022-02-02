import 'package:flutter/material.dart';
import 'package:shorten_links_app/bloc/shorten_url_bloc.dart';
import 'package:shorten_links_app/ui/widgets/button_send_url.dart';
import 'package:shorten_links_app/ui/widgets/text_field_url.dart';

class InputRow extends StatelessWidget {
  const InputRow({Key? key, required this.urlBloc}) : super(key: key);

  final ShortenUrlBloc urlBloc;
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        key: const Key('RowTop'),
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFieldUrl(
            textController: textEditingController,
          ),
          ButtonSendUrl(
            textController: textEditingController,
            urlBloc: urlBloc,
          )
        ],
      ),
    );
  }
}
