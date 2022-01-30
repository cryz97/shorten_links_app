import 'package:flutter/material.dart';
import 'package:shorten_links_app/bloc/shorten_url_bloc.dart';

class ButtonSendUrl extends StatelessWidget {
  const ButtonSendUrl(
      {Key? key, required this.textController, required this.urlBloc})
      : super(key: key);

  final TextEditingController textController;
  final ShortenUrlBloc urlBloc;
  @override
  Widget build(BuildContext context) {
    void sendUrl() {
      if (textController.text.isNotEmpty) {
        urlBloc.addUrlAlias(textController.value.text);
      }
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.20,
      height: 60,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          onPressed: sendUrl,
          child: const Icon(
            Icons.navigate_next,
            size: 48,
          )),
    );
  }
}
