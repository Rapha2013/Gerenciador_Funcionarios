import 'package:client_app/pages/cadastro.dart';
import 'package:client_app/pages/lista.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/services.dart';


void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const Drawer(child: MenuItens()),
        body: const Center(child: Text("Gerenciador de Funcionários")),
      ),
    ),
  );
}

class MenuItens extends StatelessWidget {
  const MenuItens({Key? key}) : super(key: key);

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
            child: Center(child: Text('Menu', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35))),
          ),
        ),
         ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            }),
        ListTile(
            leading: const Icon(Icons.person_add_alt_1_rounded),
            title: const Text("Cadastrar Funcionário"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cadastro()),
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
      ],
    );
  }
}
