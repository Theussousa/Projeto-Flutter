import 'package:flutter/material.dart';

import 'itens.dart';

class Resultado extends StatelessWidget {
  final List<Map<String, String>> respostas;
  final VoidCallback reiniciar;

  const Resultado({
    super.key,
    required this.respostas,
    required this.reiniciar,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Respostas',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...respostas.map(
            (resp) => Itens(
              pergunta: resp['pergunta'] ?? '',
              resposta: resp['resposta'] ?? '',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: reiniciar,
            child: const Text('Reiniciar'),
          ),
        ],
      ),
    );
  }
}


