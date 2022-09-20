import 'package:client_app/models/cargo.dart';
import 'package:flutter/material.dart';

class CargosTile extends StatelessWidget {
  const CargosTile({Key? key, required this.cargo})
      : super(key: key);

  final Cargo cargo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cargo.descricao),
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
