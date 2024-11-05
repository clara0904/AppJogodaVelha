import 'package:flutter/material.dart';

class BotaoReiniciar extends StatelessWidget {
  final Function onPressed;
  const BotaoReiniciar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 14, 8, 146))),
      onPressed: () {
        onPressed();
      },
      child: const Text("Reiniciar Jogo", 
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      )
    );
  }
}