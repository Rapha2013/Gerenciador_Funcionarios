import 'package:client_app/models/funcionario.dart';
import 'package:client_app/models/setor.dart';
import 'package:flutter/material.dart';

class SetoresTile extends StatelessWidget {
  const SetoresTile({Key? key, required this.setor}) : super(key: key);

  final Setor setor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(setor.descricao),
      // ignore: sized_box_for_whitespace
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: (() {
                  print('ver fun');
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
