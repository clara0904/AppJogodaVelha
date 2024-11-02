import 'package:flutter/material.dart';

class Jogada extends StatelessWidget {
  final String jogadorAtual;
  const Jogada({super.key, required this.jogadorAtual});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'Faça a sua jogada, jogador $jogadorAtual!',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}