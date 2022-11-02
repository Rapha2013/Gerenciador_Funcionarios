import 'package:client_app/models/cargo.dart';
import 'package:client_app/repositories/cargo_repository.dart';
import 'package:mobx/mobx.dart';

//flutter pub run build_runner build
part 'cargo_store.g.dart';

class CargoStore = _CargoStore with _$CargoStore;

abstract class _CargoStore with Store {
  _CargoStore() {
    carregarCargos();
  }

  CargoRepository repository = CargoRepository();

  @observable
  ObservableList<Cargo> listaDeCargos = ObservableList();

  @observable
  ObservableFuture<List<Cargo>> obsFuture = ObservableFuture.value([]);

  @computed
  bool get isCarregando {
    return obsFuture.status == FutureStatus.pending;
  }

  @action
  Future<void> carregarCargos() async {
    final futureList = repository.listarCargos();
    obsFuture = ObservableFuture(futureList);
    final cargos = await futureList;
    listaDeCargos.addAll(cargos);
  }

  @action
  Future<void> salvarCargo(String descricao) async {
    final cargo = await repository.salvarCargo(Cargo(descricao));
    if (cargo != null) {
      listaDeCargos.add(cargo);
    }
  }

  @action
  Future<void> excluirCargo(Cargo cargo) async {
    final foiExcluido = await repository.excluirCargo(cargo);
    if (foiExcluido) {
      listaDeCargos.removeWhere((element) => element == cargo);
    }
  }

  void atualizarCargo(Cargo cargo) {
    repository.salvarCargo(cargo);
  }
}
