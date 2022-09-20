import 'package:client_app/components/cargo.tile.dart';
import 'package:client_app/data/dummy_cargos.dart';
import 'package:flutter/material.dart';

class ListaCargo extends StatelessWidget {
  const ListaCargo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cargos = {...DUMMY_CARGOS};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Setores'),
      ),
      body: ListView.builder(
        itemCount: cargos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: CargosTile(cargo: cargos.values.elementAt(index)),
          );
        },
      ),
    );
  }
}
