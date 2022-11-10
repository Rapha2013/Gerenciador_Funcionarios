// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funcionario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FuncionarioStore on _FuncionarioStore, Store {
  Computed<bool>? _$isCarregandoComputed;

  @override
  bool get isCarregando =>
      (_$isCarregandoComputed ??= Computed<bool>(() => super.isCarregando,
              name: '_FuncionarioStore.isCarregando'))
          .value;

  late final _$listaDeFuncionariosAtom =
      Atom(name: '_FuncionarioStore.listaDeFuncionarios', context: context);

  @override
  ObservableList<Funcionario> get listaDeFuncionarios {
    _$listaDeFuncionariosAtom.reportRead();
    return super.listaDeFuncionarios;
  }

  @override
  set listaDeFuncionarios(ObservableList<Funcionario> value) {
    _$listaDeFuncionariosAtom.reportWrite(value, super.listaDeFuncionarios, () {
      super.listaDeFuncionarios = value;
    });
  }

  late final _$obsFutureAtom =
      Atom(name: '_FuncionarioStore.obsFuture', context: context);

  @override
  ObservableFuture<List<Funcionario>> get obsFuture {
    _$obsFutureAtom.reportRead();
    return super.obsFuture;
  }

  @override
  set obsFuture(ObservableFuture<List<Funcionario>> value) {
    _$obsFutureAtom.reportWrite(value, super.obsFuture, () {
      super.obsFuture = value;
    });
  }

  late final _$carregarFuncionariosAsyncAction =
      AsyncAction('_FuncionarioStore.carregarFuncionarios', context: context);

  @override
  Future<void> carregarFuncionarios() {
    return _$carregarFuncionariosAsyncAction
        .run(() => super.carregarFuncionarios());
  }

  late final _$salvarFuncionarioAsyncAction =
      AsyncAction('_FuncionarioStore.salvarFuncionario', context: context);

  @override
  Future<void> salvarFuncionario(
      String nome, String email, int idade, String idCargo, String idSetor) {
    return _$salvarFuncionarioAsyncAction.run(
        () => super.salvarFuncionario(nome, email, idade, idCargo, idSetor));
  }

  late final _$excluirFuncionarioAsyncAction =
      AsyncAction('_FuncionarioStore.excluirFuncionario', context: context);

  @override
  Future<void> excluirFuncionario(Funcionario funcionario) {
    return _$excluirFuncionarioAsyncAction
        .run(() => super.excluirFuncionario(funcionario));
  }

  @override
  String toString() {
    return '''
listaDeFuncionarios: ${listaDeFuncionarios},
obsFuture: ${obsFuture},
isCarregando: ${isCarregando}
    ''';
  }
}
