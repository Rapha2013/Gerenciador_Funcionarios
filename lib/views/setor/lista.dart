import 'package:client_app/models_views/setor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SetorPage extends StatelessWidget {
  SetorStore setorStore = SetorStore();

  final descricaoController = TextEditingController();

  SetorPage({super.key});

  @override
  Widget build(BuildContext context) {
    void adicionarSetor() async {
      if (descricaoController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Informar setor"),
          duration: Duration(seconds: 2),
        ));
        return;
      }
      setorStore.salvarSetor(descricaoController.text);
      descricaoController.clear();
      Navigator.of(context, rootNavigator: true).pop('OK');
    }

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Incluir setor'),
            content: TextField(
              autocorrect: true,
              textCapitalization: TextCapitalization.sentences,
              controller: descricaoController,
              decoration: const InputDecoration(
                labelText: "Novo setor",
                labelStyle: TextStyle(color: Colors.blueAccent),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancelar'),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  adicionarSetor();
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
      body: Observer(builder: (_) {
        if (setorStore.isCarregando) {
          return const Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (setorStore.listaDeSetores.isEmpty) {
          return const Center(
            child: SizedBox(
              width: 300,
              height: 100,
              child: Text(
                "Nenhum setor cadastrado!",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.only(top: 10.0),
          itemCount: setorStore.listaDeSetores.length,
          itemBuilder: (context, index) {
            final setor = setorStore.listaDeSetores[index];

            ///Serve para atualizar o item
            return Observer(builder: (_) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(index.toString()),
                ),
                title: Text(setor.descricao),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed:  (() async {
                            setorStore.excluirSetor(setor);
                          }),
                          icon: const Icon(Icons.delete, color: Colors.red))
                    ],
                  ),
                ),
              );
            });
          },
        );
      }),

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
