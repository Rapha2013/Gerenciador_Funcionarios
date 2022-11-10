import 'package:client_app/views/cargo/lista.dart';
import 'package:client_app/views/funcionario/lista.dart';
import 'package:client_app/views/setor/lista.dart';
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
          },
        ),
        ListTile(
          leading: const Icon(Icons.format_list_bulleted_outlined),
          title: const Text("Listar Funcionários"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListaFuncionariosPage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.format_list_bulleted_outlined),
          title: const Text("Lista de Cargos"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CargoPage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.format_list_bulleted_outlined),
          title: const Text("Lista de Setores"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SetorPage()),
            );
          },
        ),
      ],
    );
  }
}
