import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String vencedor;
  const ResultScreen({super.key, required this.vencedor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Velha', style: TextStyle(fontSize: 27.0)),
        centerTitle: true,
      ),
      body:
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.emoji_events, size: 90.0,color: Colors.amberAccent,),
              ),
              Text('Resultado: $vencedor',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}