
import 'package:client_app/models/setor.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class SetorRepository {
  //CRUD
  Future<Setor?> salvarSetor(Setor setor) async {
    final parser = ParseObject('Setor')..set('descricao', setor.descricao);

    if (setor.id.isNotEmpty) {
      parser.objectId = setor.id;
    }

    final ParseResponse response = await parser.save();
    if (response.success && response.result != null) {
      final object = response.result as ParseObject;
      setor.id = object.objectId!;
      return setor;
    }
    return null;
  }

  Future<List<Setor>> listarSetores() async {

    QueryBuilder<ParseObject> queryTodo =
    QueryBuilder<ParseObject>(ParseObject('Setor'));

    final ParseResponse apiResponse = await queryTodo.query();

    List<Setor> lista = [];
    if (apiResponse.success && apiResponse.results != null) {
      final objects = apiResponse.results as List<ParseObject>;
      for (ParseObject object in objects) {
        final id = object.objectId;
        final descricao = object.get<String>('descricao')!;
        Setor setor = Setor(descricao);
        setor.id = id!;
        lista.add(setor);
      }
      return lista;
    } else {
      return [];
    }
  }

  Future<bool> excluirSetor(Setor setor) async {
    var parse = ParseObject('Setor')..objectId = setor.id;
    final ParseResponse response = await parse.delete();
    if (response.success) {
      return true;
    }
    return false;
  }
}
