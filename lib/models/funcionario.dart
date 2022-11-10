
import 'package:client_app/models/cargo.dart';
import 'package:client_app/models/setor.dart';
import 'package:mobx/mobx.dart';

//flutter pub run build_runner build
part 'funcionario.g.dart';

class Funcionario = _Funcionario with _$Funcionario;

abstract class _Funcionario with Store {

  _Funcionario(this.nome, this.email, this.idade, this.idSetor, this.idCargo);

  String id = '';
  String nome = '';
  String email = '';
  int idade = 0;
  String idSetor = '';
  String idCargo = '';

}
