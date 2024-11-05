import 'package:flutter/material.dart';

class BotaoResultado extends StatelessWidget {
  final Function onPressed;
  const BotaoResultado({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 10, 114, 114))),
      onPressed: () {
        onPressed();
      },
      child: const Text("Ver resultados", 
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}