
import 'package:client_app/pages/funcionario/cadastro.dart';
import 'package:client_app/pages/funcionario/lista.dart';
import 'package:flutter/material.dart';

class MenuItens extends StatefulWidget {
  const MenuItens({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MenuItensPage();
}

class _MenuItensPage extends State<MenuItens> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 80.0,
          child: DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            margin: EdgeInsets.all(0.0),
            padding: EdgeInsets.all(0.0),
            child: Center(
                child: Text('Menu',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35))),
          ),
        ),
        ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Início"),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            }),
        ListTile(
            leading: const Icon(Icons.person_add_alt_1_rounded),
            title: const Text("Cadastrar Funcionário"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cadastro()),
              );
            }),
        ListTile(
            leading: const Icon(Icons.format_list_bulleted_outlined),
            title: const Text("Listar Funcionários"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Lista()),
              );
            }),
        ListTile(
            leading: const Icon(Icons.add),
            title: const Text("Cadastro de Cargos"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Lista()),
              );
            }),
        ListTile(
            leading: const Icon(Icons.format_list_bulleted_outlined),
            title: const Text("Lista de Cargos"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Lista()),
              );
            }),
        ListTile(
            leading: const Icon(Icons.add),
            title: const Text("Cadastro de Setores"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Lista()),
              );
            }),
        ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text("Lista de Setores"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Lista()),
              );
            }),
      ],
    );
  }
}
