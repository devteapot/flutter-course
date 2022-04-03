import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('I Am Poor'),
          backgroundColor: Colors.green[900],
        ),
        body: const Center(
          child: Image(
            image: AssetImage('images/shiba.png'),
          ),
        ),
        backgroundColor: Colors.black,
      ),
    ),
  );
}
