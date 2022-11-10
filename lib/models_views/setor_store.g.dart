// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SetorStore on _SetorStore, Store {
  Computed<bool>? _$isCarregandoComputed;

  @override
  bool get isCarregando =>
      (_$isCarregandoComputed ??= Computed<bool>(() => super.isCarregando,
              name: '_SetorStore.isCarregando'))
          .value;

  late final _$listaDeSetoresAtom =
      Atom(name: '_SetorStore.listaDeSetores', context: context);

  @override
  ObservableList<Setor> get listaDeSetores {
    _$listaDeSetoresAtom.reportRead();
    return super.listaDeSetores;
  }

  @override
  set listaDeSetores(ObservableList<Setor> value) {
    _$listaDeSetoresAtom.reportWrite(value, super.listaDeSetores, () {
      super.listaDeSetores = value;
    });
  }

  late final _$obsFutureAtom =
      Atom(name: '_SetorStore.obsFuture', context: context);

  @override
  ObservableFuture<List<Setor>> get obsFuture {
    _$obsFutureAtom.reportRead();
    return super.obsFuture;
  }

  @override
  set obsFuture(ObservableFuture<List<Setor>> value) {
    _$obsFutureAtom.reportWrite(value, super.obsFuture, () {
      super.obsFuture = value;
    });
  }

  late final _$carregarSetoresAsyncAction =
      AsyncAction('_SetorStore.carregarSetores', context: context);

  @override
  Future<void> carregarSetores() {
    return _$carregarSetoresAsyncAction.run(() => super.carregarSetores());
  }

  late final _$salvarSetorAsyncAction =
      AsyncAction('_SetorStore.salvarSetor', context: context);

  @override
  Future<void> salvarSetor(String descricao) {
    return _$salvarSetorAsyncAction.run(() => super.salvarSetor(descricao));
  }

  late final _$excluirSetorAsyncAction =
      AsyncAction('_SetorStore.excluirSetor', context: context);

  @override
  Future<void> excluirSetor(Setor setor) {
    return _$excluirSetorAsyncAction.run(() => super.excluirSetor(setor));
  }

  @override
  String toString() {
    return '''
listaDeSetores: ${listaDeSetores},
obsFuture: ${obsFuture},
isCarregando: ${isCarregando}
    ''';
  }
}
