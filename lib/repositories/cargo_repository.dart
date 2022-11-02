import 'package:client_app/models/cargo.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CargoRepository {
  //CRUD
  Future<Cargo?> salvarCargo(Cargo cargo) async {
    final parser = ParseObject('Cargo')..set('descricao', cargo.descricao);

    if (cargo.id.isNotEmpty) {
      parser.objectId = cargo.id;
    }

    final ParseResponse response = await parser.save();
    if (response.success && response.result != null) {
      final object = response.result as ParseObject;
      cargo.id = object.objectId!;
      return cargo;
    }
    return null;
  }

  Future<List<Cargo>> listarCargos() async {

    QueryBuilder<ParseObject> queryTodo =
    QueryBuilder<ParseObject>(ParseObject('Cargo'));

    final ParseResponse apiResponse = await queryTodo.query();

    List<Cargo> lista = [];
    if (apiResponse.success && apiResponse.results != null) {
      final objects = apiResponse.results as List<ParseObject>;
      for (ParseObject object in objects) {
        final id = object.objectId;
        final descricao = object.get<String>('descricao')!;
        Cargo cargo = Cargo(descricao);
        cargo.id = id!;
        lista.add(cargo);
      }
      return lista;
    } else {
      return [];
    }
  }

  Future<bool> excluirCargo(Cargo cargo) async {
    var parse = ParseObject('Cargo')..objectId = cargo.id;
    final ParseResponse response = await parse.delete();
    if (response.success) {
      return true;
    }
    return false;
  }
}
