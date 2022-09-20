import 'dart:math';

import 'package:client_app/data/dummy_funcionarios.dart';
import 'package:flutter/cupertino.dart';
import 'package:client_app/models/funcionario.dart';

// ignore: camel_case_types
class Funcionarios with ChangeNotifier {
  // ignore: unused_field
  final Map<String, Funcionario> _items = {...DUMMY_FUNCIONARIOS};

  List<Funcionario> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Funcionario byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Funcionario funcionario) {
    // ignore: unnecessary_null_comparison
    if (funcionario == null) {
      return;
    }

    final id = Random().nextDouble().toString();

    // ignore: prefer_const_constructors
    _items.putIfAbsent(
        id,
        () => Funcionario(
            id: int.parse(id),
            nome: funcionario.nome,
            email: funcionario.email,
            idade: funcionario.idade,
            telefone: funcionario.telefone,
            cpf: funcionario.cpf,
            rua: funcionario.rua,
            bairro: funcionario.bairro,
            cidade: funcionario.cidade,
            estado: funcionario.estado,
            setor: funcionario.setor,
            cargo: funcionario.cargo,
            img: funcionario.img));

    // notifyListeners();
  }
}
