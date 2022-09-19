
import 'package:client_app/components/funcionario_tile.dart';
import 'package:flutter/material.dart';
import 'package:client_app/provider/funcionarios.dart';

import 'package:provider/provider.dart';

class Lista extends StatelessWidget {
  const Lista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Funcionarios funcionarios = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Funcionários'),
        ),
        body: ListView.builder(
          itemCount: funcionarios.count,
          itemBuilder: (context, index) => FuncionarioTile(funcionario: funcionarios.byIndex(index)),
        ));
  }
}
