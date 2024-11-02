import 'package:flutter/material.dart';
import 'package:jogo_da_velha/screens/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 12, 18, 49),
        scaffoldBackgroundColor: const Color.fromARGB(255, 12, 18, 49)
      ),
      home: const GameScreen(),
    );
  }
}
