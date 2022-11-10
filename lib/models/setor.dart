import 'package:mobx/mobx.dart';

//flutter pub run build_runner build
part 'setor.g.dart';

class Setor = _Setor with _$Setor;

abstract class _Setor with Store {

  _Setor(this.descricao);

  String id = '';
  String descricao = '';

}