import 'package:flutter/material.dart';

import 'itens.dart';

class Resultado extends StatelessWidget {
  final List<Map<String, dynamic>> respostas;
  final VoidCallback reiniciar;
  final int totalPontos;

  const Resultado({
    super.key,
    required this.respostas,
    required this.reiniciar,
    required this.totalPontos,
  });

  @override
  Widget build(BuildContext context) {
    final String mensagem = totalPontos == 10
        ? 'PARABÉNS'
        : totalPontos > 6
            ? 'APROVADO'
            : totalPontos > 3
                ? 'RECUPERAÇÃO'
                : 'REPROVADO';

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
              ponto: (resp['ponto'] ?? 0) as int,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '$mensagem - Você fez $totalPontos pontos',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: totalPontos == 10
                  ? Colors.green
                  : totalPontos > 6
                      ? Colors.blue
                      : Colors.red,
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


