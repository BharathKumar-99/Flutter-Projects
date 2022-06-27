import 'package:flutter/material.dart';

import 'Screens/WelcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green, // This is the theme of your application.
        brightness: Brightness.light,
      ),
      home: const Welcome(),
    );
  }
}
