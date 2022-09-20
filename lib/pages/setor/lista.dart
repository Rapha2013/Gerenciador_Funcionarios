import 'package:client_app/components/setor.tile.dart';
import 'package:client_app/data/dummy_setores.dart';
import 'package:flutter/material.dart';

class ListaSetor extends StatelessWidget {
  const ListaSetor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final setores = {...DUMMY_SETORES};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Setores'),
      ),
      body: ListView.builder(
        itemCount: setores.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: SetoresTile(setor: setores.values.elementAt(index)),
          );
        },
      ),
    );
  }
}
