import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  final String texto;
  final Function() resp;

  const Botoes({
    super.key,
    required this.texto,
    required this.resp,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: resp,
        child: Text(texto),
      ),
    );
  }
}


