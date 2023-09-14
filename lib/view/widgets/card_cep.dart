import 'package:api_desafio/view/widgets/tipografia.dart';
import 'package:flutter/material.dart';

import '../../data/cep_back4app_repository.dart';
import '../../model/cep.dart';

class CardCep extends StatefulWidget {
  final Cep cep;
  const CardCep({
    super.key,
    required this.cep,
  });

  @override
  State<CardCep> createState() => _CardCepState();
}

class _CardCepState extends State<CardCep> {
  late CepBack4AppRepository cepBack4AppRepository;
  void deletar(String objId) async {
    cepBack4AppRepository = CepBack4AppRepository();
    cepBack4AppRepository.deletar(objId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              H1(titulo: "Dados do endereço"),
              Icon(
                Icons.place,
                color: Colors.black26,
              ),
            ],
          ),
          ParagrafoBase(
            texto: "Cep: ${widget.cep.cep}",
          ),
          ParagrafoBase(
            texto: "Logradouro: ${widget.cep.logradouro}",
          ),
          ParagrafoBase(
            texto: "Complemento: ${widget.cep.complemento}",
          ),
          ParagrafoBase(
            texto: "Bairro: ${widget.cep.bairro}",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ParagrafoBase(
                texto: "Cidade: ${widget.cep.cidade}",
              ),
              ParagrafoBase(
                texto: "Estado: ${widget.cep.estado}",
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1, color: Colors.black12))),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Atualizar",
                      style: TextStyle(color: Colors.blue),
                    )),
              )),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: const Text("Deletar cep"),
                                content: Container(
                                  child: const Text(
                                      "Deseja realmente excluir este endereço?"),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Cancelar",
                                        style: TextStyle(color: Colors.black87),
                                      )),
                                  TextButton(
                                      onPressed: () async {
                                        deletar(widget.cep.objId!);
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Excluir",
                                        style: TextStyle(color: Colors.red),
                                      )),
                                ],
                              );
                            });
                      },
                      child: const Text(
                        "Deletar",
                        style: TextStyle(color: Colors.red),
                      ))),
            ],
          )
        ],
      ),
    );
  }
}
