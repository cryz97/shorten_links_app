import 'package:flutter/material.dart';

class TextFieldUrl extends StatelessWidget {
  const TextFieldUrl({Key? key, required this.textController})
      : super(key: key);

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.70,
      child: TextField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(), hintText: 'Enter a URL to short'),
        controller: textController,
      ),
    );
  }
}
