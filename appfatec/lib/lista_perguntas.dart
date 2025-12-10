import 'package:flutter/material.dart';

import 'botoes.dart';
import 'pergunta_respostas.dart';

class ListaPerguntas extends StatelessWidget {
  final int indicePergunta;
  final List<PerguntaRespostas> dados;
  final void Function(String, int) responder;

  const ListaPerguntas({
    super.key,
    required this.indicePergunta,
    required this.dados,
    required this.responder,
  });

  @override
  Widget build(BuildContext context) {
    final perguntaAtual = dados[indicePergunta];
    // Cópia da lista de respostas para poder embaralhar
    final List<Map<String, dynamic>> respostas =
        List<Map<String, dynamic>>.from(perguntaAtual.respostas);
    respostas.shuffle();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          perguntaAtual.pergunta,
          style: const TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Image.asset(
            'assets/images/${perguntaAtual.imagem}',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        ...respostas.map((resposta) {
          return Botoes(
            txt: resposta['r'] as String,
            ponto: resposta['p'] as int,
            resp: responder,
          );
        }),
      ],
    );
  }
}


