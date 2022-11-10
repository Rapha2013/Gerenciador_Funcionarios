import 'package:client_app/models_views/funcionario_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListaFuncionariosPage extends StatelessWidget {

  FuncionarioStore funcionarioStore = FuncionarioStore();

  ListaFuncionariosPage({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
