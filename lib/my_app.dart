import 'package:api_desafio/view/cadastro_cep_page.dart';
import 'package:api_desafio/view/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
      routes: {
        "/home": (context) => const HomePage(),
        "/cadastro": (context) => const CadastroCepPage(),
      },
    );
  }
}
