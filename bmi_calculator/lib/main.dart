import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF0a0e21),
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0a0e21)),
        scaffoldBackgroundColor: const Color(0xFF0a0e21),
      ),
      home: const InputPage(),
    );
  }
}
