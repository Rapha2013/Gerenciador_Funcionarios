import 'package:client_app/models/cargo.dart';
import 'package:client_app/models/funcionario.dart';
import 'package:client_app/models/setor.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class FuncionarioRepository {
  //CRUD
  Future<Funcionario?> salvarFuncionario(Funcionario funcionario) async {
    final parser = ParseObject('Funcionario')
      ..set('nome', funcionario.nome)
      ..set('email', funcionario.email)
      ..set('idade', funcionario.idade)
      ..set('idCargo', funcionario.idade)
      ..set('idSetor', funcionario.idade);

    if (funcionario.id.isNotEmpty) {
      parser.objectId = funcionario.id;
    }

    final ParseResponse response = await parser.save();
    if (response.success && response.result != null) {
      final object = response.result as ParseObject;
      funcionario.id = object.objectId!;
      return funcionario;
    }
    return null;
  }

  Future<List<Funcionario>> listarFuncionarios() async {
    QueryBuilder<ParseObject> queryTodo =
        QueryBuilder<ParseObject>(ParseObject('Funcionario'));

    final ParseResponse apiResponse = await queryTodo.query();

    List<Funcionario> lista = [];
    if (apiResponse.success && apiResponse.results != null) {
      final objects = apiResponse.results as List<ParseObject>;

      for (ParseObject object in objects) {
        final id = object.objectId;
        final nome = object.get<String>('nome')!;
        final email = object.get<String>('email')!;
        final idade = object.get<int>('idade')!;
        final idSetor = object.get<ParseObject>('idSetor')!;
        final idCargo = object.get<ParseObject>('idCargo')!;

        final QueryBuilder<ParseObject> parseQueryCargo =
            QueryBuilder<ParseObject>(ParseObject('Cargo'));
        parseQueryCargo.whereContains('objectId', idCargo.objectId.toString());
        final apiResponseCargo = await parseQueryCargo.query();

        final QueryBuilder<ParseObject> parseSetor =
            QueryBuilder<ParseObject>(ParseObject('Setor'));
        parseSetor.whereContains('objectId', idSetor.objectId.toString());
        final apiResponseSetor = await parseSetor.query();

        var cargo = '';
        var setor = '';

        if (apiResponseCargo.success && apiResponseCargo.results != null) {
          for (var object in apiResponseCargo.results as List<ParseObject>) {
            cargo = object.get<String>('descricao').toString();
          }
        }

        if (apiResponseSetor.success && apiResponseSetor.results != null) {
          for (var object in apiResponseSetor.results as List<ParseObject>) {
            setor = object.get<String>('descricao').toString();
          }
        }

        Funcionario funcionario = Funcionario(
            nome, email, idade, setor, cargo);

        funcionario.id = id!;
        funcionario.nome = nome;
        funcionario.email = email;
        funcionario.idade = idade;
        funcionario.idSetor = setor;
        funcionario.idCargo = cargo;

        lista.add(funcionario);
      }
      return lista;
    } else {
      return [];
    }
  }

  Future<bool> excluirFuncionario(Funcionario funcionario) async {
    var parse = ParseObject('Funcionario')..objectId = funcionario.id;
    final ParseResponse response = await parse.delete();
    if (response.success) {
      return true;
    }
    return false;
  }
}
