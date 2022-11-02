import 'package:mobx/mobx.dart';

//flutter pub run build_runner build
part 'cargo.g.dart';

class Cargo = _Cargo with _$Cargo;

abstract class _Cargo with Store {

  _Cargo(this.descricao);

  String id = '';
  String descricao = '';

}