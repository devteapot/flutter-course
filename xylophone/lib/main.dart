import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final player = AudioCache();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  List<Widget> makeButtons(List<Color> colors) => colors
      .asMap()
      .entries
      .map(
        (e) => Expanded(
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: e.value),
            onPressed: () {
              player.play('note${e.key + 1}.wav');
            },
            child: Container(),
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: makeButtons([
              Colors.red,
              Colors.orange,
              Colors.yellow,
              Colors.green,
              Colors.teal,
              Colors.blue,
              Colors.purple,
            ]),
          ),
        ),
      ),
    );
  }
}
