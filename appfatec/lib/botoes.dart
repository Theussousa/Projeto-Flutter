import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  final String txt;
  final void Function(String) resp;

  const Botoes({
    super.key,
    required this.txt,
    required this.resp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => resp(txt),
          child: Text(
            txt,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}


