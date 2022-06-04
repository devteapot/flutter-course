import "dart:math";

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int ball = 1;

  void randomizeResponse() {
    setState(() {
      ball = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text("Ask Me Anything"),
        ),
        body: Container(
          color: Colors.blue,
          child: Center(
            child: TextButton(
              onPressed: randomizeResponse,
              child: Image.asset("images/ball$ball.png"),
            ),
          ),
        ),
      ),
    );
  }
}
