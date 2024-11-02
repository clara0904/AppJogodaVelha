import 'package:flutter/material.dart';

class MensagemFinal extends StatelessWidget {
  final String mensagemFinal;
  const MensagemFinal({super.key, required this.mensagemFinal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        mensagemFinal,
        style: const TextStyle(
          color: Colors.green,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}