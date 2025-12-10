import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dados.dart';
import 'lista_perguntas.dart';
import 'resultado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: const MyHomePage(title: 'Matheus Flores'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Lista de perguntas vinda de dados.dart
  final dados = perguntasRespostas;

  // Lista de respostas escolhidas
  final List<Map<String, dynamic>> respostas = [];

  // Índice da pergunta atual
  int indicePergunta = 0;

  // Pontuação total
  int totalPontos = 0;

  // Getter para saber se ainda há perguntas
  bool get temPergunta {
    return indicePergunta < dados.length;
  }

  @override
  void initState() {
    super.initState();
    dados.shuffle();
  }

  // Método chamado pelos botões, recebendo a resposta escolhida e a pontuação
  void responder(String r, int ponto) {
    final String perguntaAtual = dados[indicePergunta].pergunta;

    setState(() {
      respostas.add({
        'pergunta': perguntaAtual,
        'resposta': r,
        'ponto': ponto,
      });
      indicePergunta++;
      totalPontos += ponto;
    });
  }

  void reiniciar() {
    setState(() {
      indicePergunta = 0;
      respostas.clear();
      totalPontos = 0;
      dados.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 242, 235),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        toolbarHeight: 80,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          temPergunta
              ? ListaPerguntas(
                  indicePergunta: indicePergunta,
                  dados: dados,
                  responder: responder,
                )
              : Resultado(
                  respostas: respostas,
                  reiniciar: reiniciar,
                  totalPontos: totalPontos,
                ),
        ],
      ),
    );
  }
}
