import 'package:client_app/data/dummy_funcionarios.dart';
import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  const Lista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const funcionariosList = {...DUMMY_FUNCIONARIOS};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Funcionários'),
      ),
      body: ListView.builder(
                itemCount: funcionariosList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    // ignore: prefer_interpolation_to_compose_strings
                    title: Text(funcionariosList.values.elementAt(index).nome + ' ' + funcionariosList.values.elementAt(index).sobrenome + ' - Idade: ' + funcionariosList.values.elementAt(index).idade.toString()),
                    // ignore: prefer_interpolation_to_compose_strings
                    subtitle: Text(funcionariosList.values.elementAt(index).email),
                  );
                },
        )
    );
  }
}
