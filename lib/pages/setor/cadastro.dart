import 'package:flutter/material.dart';

class CadastrarSetor extends StatefulWidget {
  const CadastrarSetor({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyForm createState() => _MyForm();
}

class _MyForm extends State<CadastrarSetor> {
  final Map<String, String> _formData = {};

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Setor'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: _formData['descricao'],
                    decoration: const InputDecoration(labelText: 'Descrição'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
