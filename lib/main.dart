import 'package:flutter/material.dart';
import 'package:jogo_da_velha/database/app_database.dart';
import 'package:jogo_da_velha/screens/game_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppDatabase database = AppDatabase();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Jogo da Velha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 12, 18, 49),
        scaffoldBackgroundColor: const Color.fromARGB(255, 12, 18, 49)
      ),
      home: GameScreen(database: database),
    );
  }
}
