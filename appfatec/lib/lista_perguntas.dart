import 'package:flutter/material.dart';

import 'botoes.dart';
import 'pergunta_respostas.dart';

class ListaPerguntas extends StatelessWidget {
  final int indicePergunta;
  final List<PerguntaRespostas> dados;
  final void Function(String) responder;

  const ListaPerguntas({
    super.key,
    required this.indicePergunta,
    required this.dados,
    required this.responder,
  });

  @override
  Widget build(BuildContext context) {
    final perguntaAtual = dados[indicePergunta];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          perguntaAtual.pergunta,
          style: const TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ...perguntaAtual.respostas.map(
          (textoBotao) => Botoes(
            resp: responder,
            txt: textoBotao,
          ),
        ),
      ],
    );
  }
}


