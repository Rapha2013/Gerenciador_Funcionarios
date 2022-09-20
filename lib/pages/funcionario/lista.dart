import 'package:client_app/components/funcionario_tile.dart';
import 'package:flutter/material.dart';
import 'package:client_app/provider/funcionarios.dart';
import 'package:provider/provider.dart';


// ignore: use_key_in_widget_constructors
class Lista extends StatefulWidget {

  @override
  // ignore: library_private_types_in_public_api
  _MyList createState() => _MyList();
}

class _MyList extends State<Lista> {
  @override
  Widget build(BuildContext context) {

    final Funcionarios funcionarios = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Funcionários'),
      ),
      body: ListView.builder(
        itemCount: funcionarios.count,
        itemBuilder: (context, index) => FuncionarioTile(
          funcionario: funcionarios.byIndex(index),
        ),
      ),
    );
  }
}
