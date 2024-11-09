import 'package:flutter/material.dart';
import 'package:jogo_da_velha/database/app_database.dart';

class ResultScreen extends StatelessWidget {
  final AppDatabase database;

  const ResultScreen({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados', style: TextStyle(fontSize: 27.0)),
        centerTitle: true,
      ),
      body: FutureBuilder<List<GameResult>>(
        future: database.getAllResults(),
        builder: (context, snapshot) {
          final results = snapshot.data ?? []; 

          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final game = results[index];
              return ListTile(
                leading: const Icon(Icons.emoji_events, color: Colors.amberAccent),
                title: Text(
                  'Resultado: ${game.vencedor}',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                subtitle: Text(
                  'Data: ${game.date.toString()}',
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
