import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
            child: Column(
      children: [
        ListTile(
          title: Text("Editar cep"),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/deletar");
          },
          child: ListTile(
            title: Text("Apagar cep"),
          ),
        )
      ],
    )));
  }
}
