import 'package:client_app/models/funcionario.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class EditarFuncionario extends StatelessWidget {
  final Map<String, String> _formData = {};

  void _loadFunc(Funcionario funcionario) {
    _formData['nome'] = funcionario.nome;
    _formData['email'] = funcionario.email;
    _formData['idade'] = funcionario.idade.toString();
    _formData['telefone'] = funcionario.telefone.toString();
    _formData['cpf'] = funcionario.cpf.toString();
    _formData['rua'] = funcionario.rua;
    _formData['bairro'] = funcionario.bairro;
    _formData['cidade'] = funcionario.cidade;
    _formData['estado'] = funcionario.estado;
    _formData['setor'] = funcionario.setor;
    _formData['cargo'] = funcionario.cargo;
    _formData['img'] = funcionario.img;
  }

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final funcionario =
        ModalRoute.of(context)!.settings.arguments as Funcionario;

    _loadFunc(funcionario);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Usuário'),
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
                    initialValue: _formData['nome'],
                    decoration: const InputDecoration(labelText: 'Nome'),
                  ),
                  TextFormField(
                    initialValue: _formData['email'],
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    initialValue: _formData['idade'],
                    decoration: const InputDecoration(labelText: 'Idade'),
                  ),
                  TextFormField(
                    initialValue: _formData['telefone'],
                    decoration: const InputDecoration(labelText: 'telefone'),
                  ),
                  TextFormField(
                    initialValue: _formData['cpf'],
                    decoration: const InputDecoration(labelText: 'cpf'),
                  ),
                  TextFormField(
                    initialValue: _formData['rua'],
                    decoration: const InputDecoration(labelText: 'rua'),
                  ),
                  TextFormField(
                    initialValue: _formData['bairro'],
                    decoration: const InputDecoration(labelText: 'bairro'),
                  ),
                  TextFormField(
                    initialValue: _formData['cidade'],
                    decoration: const InputDecoration(labelText: 'cidade'),
                  ),
                  TextFormField(
                    initialValue: _formData['estado'],
                    decoration: const InputDecoration(labelText: 'estado'),
                  ),
                  TextFormField(
                    initialValue: _formData['setor'],
                    decoration: const InputDecoration(labelText: 'setor'),
                  ),
                  TextFormField(
                    initialValue: _formData['cargo'],
                    decoration: const InputDecoration(labelText: 'cargo'),
                  ),
                  TextFormField(
                    initialValue: _formData['img'],
                    decoration: const InputDecoration(labelText: 'img'),
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
