import 'package:client_app/models/funcionario.dart';
import 'package:client_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class FuncionarioTile extends StatelessWidget {
  const FuncionarioTile({Key? key, required this.funcionario})
      : super(key: key);

  final Funcionario funcionario;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: AssetImage(funcionario.img)),
      // ignore: prefer_interpolation_to_compose_strings
      title: Text(funcionario.nome),
      // ignore: prefer_interpolation_to_compose_strings
      subtitle: Text(funcionario.email),
      // ignore: sized_box_for_whitespace
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: (() {
                  Navigator.of(context).pushNamed(AppRoutes.FUNCIONARIO_EDIT, arguments: funcionario);
                }),
                icon: const Icon(Icons.edit, color: Colors.orange)),
            IconButton(
                onPressed: (() {
                  print('ver fun');
                }),
                icon: const Icon(Icons.delete, color: Colors.red))
          ],
        ),
      ),
    );
  }
}
