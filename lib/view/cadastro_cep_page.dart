import 'package:api_desafio/model/cep.dart';
import 'package:api_desafio/model/cep_exeption.dart';
import 'package:api_desafio/view/widgets/custom_form_field.dart';
import 'package:api_desafio/view/widgets/primary_text_button.dart';
import 'package:api_desafio/view/widgets/tipografia.dart';
import 'package:flutter/material.dart';

import '../data/cep_back4app_repository.dart';
import '../data/cep_repository.dart';

class CadastroCepPage extends StatefulWidget {
  const CadastroCepPage({super.key});

  @override
  State<CadastroCepPage> createState() => _CadastroCepPageState();
}

class _CadastroCepPageState extends State<CadastroCepPage> {
  late CepRepository cepRepository;
  Cep cep = Cep();
  TextEditingController cepController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  late CepBack4AppRepository cepBack4AppRepository;
  bool cepEstaCadastrado = false;

  void _procurar() async {
    cepEstaCadastrado = await _cepEstaCadastrado();
    setState(() {});
    if (!cepEstaCadastrado) {
      cepRepository = CepRepository();
      cep = await cepRepository.procurar(cepController.text);
      setState(() {});
    }
  }

  Future<bool> _cepEstaCadastrado() async {
    cepBack4AppRepository = CepBack4AppRepository();
    String cepFormatado = cepController.text.replaceAll("-", "");
    bool verificacao = await cepBack4AppRepository.procurar(cepFormatado);
    return verificacao;
  }

  void _salvar() async {
    cepBack4AppRepository = CepBack4AppRepository();
    try {
      await cepBack4AppRepository.salvar(cep);
    } catch (e) {
      print(e);
      return;
    }
  }

  void _limpar() {
    cepController.text = "";
    cep = Cep();
    setState(() {});
  }

  bool _validaCep(String? cep) {
    if (cep != null) {
      cep = cep.trim();
      if (cep.isEmpty) {
        return false;
      }
      int? numero = int.tryParse(cep);
      if (numero == null) {
        return false;
      }
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cadastrar Endereço"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (String? value) {
                      if (_validaCep(value)) {
                        return null;
                      } else {
                        return "Digite um cep valido com somente números";
                      }
                    },
                    maxLength: 8,
                    keyboardType: TextInputType.number,
                    controller: cepController,
                    decoration: const InputDecoration(
                        label: Text("Cep"),
                        hintText: "Digite seu cep",
                        floatingLabelBehavior: FloatingLabelBehavior.always),
                  ),
                  PrimaryTextButton(
                    text: "Procurar",
                    funcao: _procurar,
                    globalKey: _globalKey,
                    mensage: false,
                    verificaCep: _cepEstaCadastrado,
                  ),
                  OutLineTextButton(text: "Limpar", funcao: _limpar),
                  const H1(
                    titulo: "Dados:",
                  ),
                  CustomFormField(
                    label: "Logradouro",
                    hintText: cep.logradouro ?? "logradouro",
                    enable: false,
                  ),
                  CustomFormField(
                    label: "Complemento",
                    hintText: cep.complemento ?? "complemento",
                    enable: false,
                  ),
                  CustomFormField(
                    label: "Bairro",
                    hintText: cep.bairro ?? "bairro",
                    enable: false,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: CustomFormField(
                            label: "Cidade",
                            hintText: cep.cidade ?? "cidade",
                            enable: false,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: CustomFormField(
                        label: "Estado",
                        hintText: cep.estado ?? "estado",
                        enable: false,
                      )),
                    ],
                  ),
                  PrimaryTextButton(
                    text: "Salvar",
                    funcao: _salvar,
                    globalKey: _globalKey,
                    mensage: true,
                    verificaCep: _cepEstaCadastrado,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
