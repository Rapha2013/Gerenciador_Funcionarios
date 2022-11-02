// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cargo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CargoStore on _CargoStore, Store {
  Computed<bool>? _$isCarregandoComputed;

  @override
  bool get isCarregando =>
      (_$isCarregandoComputed ??= Computed<bool>(() => super.isCarregando,
              name: '_CargoStore.isCarregando'))
          .value;

  late final _$listaDeCargosAtom =
      Atom(name: '_CargoStore.listaDeCargos', context: context);

  @override
  ObservableList<Cargo> get listaDeCargos {
    _$listaDeCargosAtom.reportRead();
    return super.listaDeCargos;
  }

  @override
  set listaDeCargos(ObservableList<Cargo> value) {
    _$listaDeCargosAtom.reportWrite(value, super.listaDeCargos, () {
      super.listaDeCargos = value;
    });
  }

  late final _$obsFutureAtom =
      Atom(name: '_CargoStore.obsFuture', context: context);

  @override
  ObservableFuture<List<Cargo>> get obsFuture {
    _$obsFutureAtom.reportRead();
    return super.obsFuture;
  }

  @override
  set obsFuture(ObservableFuture<List<Cargo>> value) {
    _$obsFutureAtom.reportWrite(value, super.obsFuture, () {
      super.obsFuture = value;
    });
  }

  late final _$carregarCargosAsyncAction =
      AsyncAction('_CargoStore.carregarCargos', context: context);

  @override
  Future<void> carregarCargos() {
    return _$carregarCargosAsyncAction.run(() => super.carregarCargos());
  }

  late final _$salvarCargoAsyncAction =
      AsyncAction('_CargoStore.salvarCargo', context: context);

  @override
  Future<void> salvarCargo(String descricao) {
    return _$salvarCargoAsyncAction.run(() => super.salvarCargo(descricao));
  }

  late final _$excluirCargoAsyncAction =
      AsyncAction('_CargoStore.excluirCargo', context: context);

  @override
  Future<void> excluirCargo(Cargo cargo) {
    return _$excluirCargoAsyncAction.run(() => super.excluirCargo(cargo));
  }

  @override
  String toString() {
    return '''
listaDeCargos: ${listaDeCargos},
obsFuture: ${obsFuture},
isCarregando: ${isCarregando}
    ''';
  }
}
