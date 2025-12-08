import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  final List<Map<String, String>> respostas = [];

  // Índice da pergunta atual
  int indicePergunta = 0;

  // Getter para saber se ainda há perguntas
  bool get temPergunta {
    return indicePergunta < dados.length;
  }

  // Método chamado pelos botões, recebendo a resposta escolhida
  void responder(String r) {
    final String perguntaAtual = dados[indicePergunta].pergunta;

    setState(() {
      respostas.add({
        'pergunta': perguntaAtual,
        'resposta': r,
      });
      indicePergunta++;
    });
  }

  void reiniciar() {
    setState(() {
      indicePergunta = 0;
      respostas.clear();
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
      body: Center(
        child: temPergunta
            ? ListaPerguntas(
                indicePergunta: indicePergunta,
                dados: dados,
                responder: responder,
              )
            : Resultado(
                respostas: respostas,
                reiniciar: reiniciar,
              ),
      ),
    );
  }
}
