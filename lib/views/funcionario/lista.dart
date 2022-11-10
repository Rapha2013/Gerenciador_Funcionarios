import 'package:client_app/models/setor.dart';
import 'package:client_app/models_views/funcionario_store.dart';
import 'package:client_app/models_views/setor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListaFuncionariosPage extends StatefulWidget {
  const ListaFuncionariosPage({super.key});

  @override
  _Lista createState() => _Lista();
}

class _Lista extends State<ListaFuncionariosPage> {

  FuncionarioStore funcionarioStore = FuncionarioStore();

  SetorStore setorStore = SetorStore();

  final nome = TextEditingController();
  final email = TextEditingController();
  final idade = TextEditingController();
  final setor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Incluir cargo'),
            content: SizedBox(
              width: 280,
              child: DropdownButton(
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: setorStore.listaDeSetores.map((Setor items) {
                  return DropdownMenuItem(
                    value: items.descricao,
                    child: Text(items.descricao),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    setor.text = newValue!;
                  });
                },
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancelar'),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  print(setor.text);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Cargos'),
      ),

      ///Serve para atualizar a lista
      body: Observer(
        builder: (_) {
          if (funcionarioStore.isCarregando) {
            return const Center(
              child: SizedBox(
                  width: 100, height: 100, child: CircularProgressIndicator()),
            );
          }

          if (funcionarioStore.listaDeFuncionarios.isEmpty) {
            return const Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: Text(
                  "Nenhum funcionario cadastrado!",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(top: 10.0),
            itemCount: funcionarioStore.listaDeFuncionarios.length,
            itemBuilder: (context, index) {
              final funcionario = funcionarioStore.listaDeFuncionarios[index];

              ///Serve para atualizar o item
              return Observer(
                builder: (_) {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(funcionario.nome),
                  );
                },
              );
            },
          );
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _showMyDialog,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.blueGrey,
        child: Container(
          height: 40,
        ),
      ),
    );
  }
}
