import 'package:flutter/material.dart';
import 'botoes.dart';

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
  // Lista de perguntas com respostas
  final List<Map<String, Object>> _perguntas = [
    {
      'pergunta': 'Qual a sua cor favorita?',
      'respostas': [
        'Preto',
        'Vermelho',
        'Azul',
        'Verde',
        'Branco',
      ],
    },
    {
      'pergunta': 'Qual o seu animal favorito?',
      'respostas': [
        'Cachorro',
        'Gato',
        'Pássaro',
        'Peixe',
        'Cavalo',
        'Coelho',
      ],
    },
    {
      'pergunta': 'Qual o seu time do coração?',
      'respostas': [
        'Corinthians',
        'Palmeiras',
        'São Paulo',
        'Santos',
        'Flamengo',
        'Vasco',
        'Outro',
      ],
    },
  ];

  // Índice da pergunta atual
  int _indicePergunta = 0;

  // Método chamado pelos botões
  void responder() {
    setState(() {
      if (_indicePergunta < _perguntas.length - 1) {
        _indicePergunta++;
      } else {
        _indicePergunta = 0;
      }
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _perguntas[_indicePergunta]['pergunta'].toString(),
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...(_perguntas[_indicePergunta]['respostas'] as List<String>)
                .map(
              (textoBotao) {
                return Botoes(
                  resp: responder,
                  txt: textoBotao,
                );
              },
            ).toList(),
          ],
        ),
      ),
    );
  }
}
