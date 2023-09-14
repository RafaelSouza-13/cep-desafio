import 'package:flutter/material.dart';

class H1 extends StatelessWidget {
  final String titulo;
  const H1({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black87,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class ParagrafoBase extends StatelessWidget {
  final String texto;
  const ParagrafoBase({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        height: 1.4,
      ),
    );
  }
}
