import 'package:flutter/material.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Resultado',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: respostas.length,
            itemBuilder: (context, index) {
              final item = respostas[index];
              return ListTile(
                title: Text(item['pergunta'] ?? ''),
                subtitle: Text('Sua resposta: ${item['resposta'] ?? ''}'),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: reiniciar,
          child: const Text('Reiniciar'),
        ),
      ],
    );
  }
}


