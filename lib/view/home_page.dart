import 'package:api_desafio/view/widgets/card_cep.dart';
import 'package:api_desafio/view/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../data/cep_back4app_repository.dart';
import '../model/cep.dart';
import '../model/ceps_cadastrados.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Cep cep = Cep();
  late CepBack4AppRepository cepBack4AppRepository;
  CepsCadastrados listaCeps = CepsCadastrados([]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterDados();
  }

  void obterDados() async {
    cepBack4AppRepository = CepBack4AppRepository();
    listaCeps = await cepBack4AppRepository.obterCeps();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Lista de ceps cadastrados"),
      ),
      drawer: const CustomDrawer(),
      body: Container(
        color: Colors.blue[50],
        child: ListView.builder(
            itemCount: listaCeps.listaCeps.length,
            itemBuilder: (_, int index) {
              var cep = listaCeps.listaCeps[index];
              return CardCep(
                cep: cep,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, "/cadastro");
        },
        label: const Text("Cadastrar"),
        icon: const Icon(Icons.add),
      ),
    ));
  }
}
