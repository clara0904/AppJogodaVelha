import 'package:flutter/material.dart';

class BotaoResultado extends StatelessWidget {
  final Function onPressed;
  const BotaoResultado({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 10, 114, 114),
        ),
        onPressed: () {
          onPressed();
        },
        icon: const Icon(
          Icons.emoji_events,
          color: Colors.amberAccent,
          size: 20,
        ),
        label: const Text(
          "Ver resultados",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
