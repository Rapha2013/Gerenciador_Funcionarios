
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Cadastro extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Funcionário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  return 'Campo nome obrigatório!';
                },
                onSaved: (newValue) => _formData['nome'] = newValue!,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Sobrenome',
                ),
                validator: (value) {
                  return 'Campo sobrenome obrigatório!';
                },
                onSaved: (newValue) => _formData['sobrenome'] = newValue!,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  return 'Campo email obrigatório!';
                },
                onSaved: (newValue) => _formData['email'] = newValue!,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Idade"),
                validator: (value) {
                  return 'Campo Idade obrigatório!';
                },
                onSaved: (newValue) => _formData['idade'] = newValue!,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    final isValid = _form.currentState!.validate();
                    if (isValid) {
                      _form.currentState!.save();

                    }
                  },
                  child: const Text('Cadastrar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
