import 'package:flutter/material.dart';

class PrimaryTextButton extends StatelessWidget {
  final String text;
  final Function() funcao;
  final Future<bool> Function() verificaCep;
  final GlobalKey<FormState> globalKey;
  final bool mensage;
  const PrimaryTextButton(
      {super.key,
      required this.text,
      required this.funcao,
      required this.globalKey,
      required this.mensage,
      required this.verificaCep});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      child: TextButton(
        onPressed: () async {
          bool estaCadastrado = await verificaCep();
          if (estaCadastrado) {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text("Cep já está cadastrado"),
                    content: const SizedBox(
                      child: Text(
                          "Seu cep ja se encontra cadastrado em nossa base de dados"),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Sair"))
                    ],
                  );
                });
            return;
          }
          if (globalKey.currentState!.validate()) {
            funcao();
            if (mensage) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Adicionando cep a lista'),
                  backgroundColor: Colors.black87,
                  behavior: SnackBarBehavior.floating,
                  elevation: 150.0,
                ),
              );
              Navigator.pop(context);
            }
          }
        },
        style: TextButton.styleFrom(backgroundColor: Colors.green),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class OutLineTextButton extends StatelessWidget {
  final String text;
  final Function() funcao;
  const OutLineTextButton(
      {super.key, required this.text, required this.funcao});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          funcao();
        },
        style: TextButton.styleFrom(
            side: const BorderSide(width: 1, color: Colors.black45)),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
