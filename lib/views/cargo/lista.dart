import 'package:client_app/models_views/cargo_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class CargoPage extends StatelessWidget {
  CargoStore cargoStore = CargoStore();

  final descricaoController = TextEditingController();

  CargoPage({super.key});

  @override
  Widget build(BuildContext context) {

    void adicionarCargo() async {
      if (descricaoController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Informar setor"),
          duration: Duration(seconds: 2),
        ));
        return;
      }
      cargoStore.salvarCargo(descricaoController.text);
      descricaoController.clear();
      Navigator.of(context, rootNavigator: true).pop('OK');
    }

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Incluir cargo'),
            content: TextField(
              autocorrect: true,
              textCapitalization: TextCapitalization.sentences,
              controller: descricaoController,
              decoration: const InputDecoration(
                  labelText: "Novo cargo",
                  labelStyle: TextStyle(color: Colors.blueAccent)),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancelar'),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  adicionarCargo();
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
        if (cargoStore.isCarregando) {
          return const Center(
            child: SizedBox(
                width: 100, height: 100, child: CircularProgressIndicator()),
          );
        }

        if (cargoStore.listaDeCargos.isEmpty) {
          return const Center(
            child: SizedBox(
              width: 300,
              height: 100,
              child: Text(
                "Nenhum cargo cadastrado!",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.only(top: 10.0),
          itemCount: cargoStore.listaDeCargos.length,
          itemBuilder: (context, index) {
            final cargo = cargoStore.listaDeCargos[index];

            ///Serve para atualizar o item
            return Observer(builder: (_) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(index.toString()),
                ),
                title: Text(cargo.descricao),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed:  (() async {
                            cargoStore.excluirCargo(cargo);
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
