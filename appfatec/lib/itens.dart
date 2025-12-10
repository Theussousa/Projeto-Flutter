import 'package:flutter/material.dart';

class Itens extends StatelessWidget {
  final String pergunta;
  final String resposta;
  final int ponto;

  const Itens({
    super.key,
    required this.pergunta,
    required this.resposta,
    required this.ponto,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pergunta,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              resposta.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
                color: ponto == 0 ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


