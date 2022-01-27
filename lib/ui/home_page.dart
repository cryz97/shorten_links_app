import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shorten Links"),
        ),
        body: StreamBuilder(
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return ListView.builder(itemBuilder: (_, i) {
            return ListTile(title: Text(i.toString()));
          });
        }));
  }
}
