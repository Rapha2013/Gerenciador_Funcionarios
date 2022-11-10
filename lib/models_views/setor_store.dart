
import 'package:client_app/models/setor.dart';
import 'package:client_app/repositories/setor_repository.dart';
import 'package:mobx/mobx.dart';

//flutter pub run build_runner build
part 'setor_store.g.dart';

class SetorStore = _SetorStore with _$SetorStore;

abstract class _SetorStore with Store {
  _SetorStore() {
    carregarSetores();
  }

  SetorRepository repository = SetorRepository();

  @observable
  ObservableList<Setor> listaDeSetores = ObservableList();

  @observable
  ObservableFuture<List<Setor>> obsFuture = ObservableFuture.value([]);

  @computed
  bool get isCarregando {
    return obsFuture.status == FutureStatus.pending;
  }

  @action
  Future<void> carregarSetores() async {
    final futureList = repository.listarSetores();
    obsFuture = ObservableFuture(futureList);
    final setores = await futureList;
    listaDeSetores.addAll(setores);
  }

  @action
  Future<void> salvarSetor(String descricao) async {
    final setor = await repository.salvarSetor(Setor(descricao));
    if (setor != null) {
      listaDeSetores.add(setor);
    }
  }

  @action
  Future<void> excluirSetor(Setor setor) async {
    final foiExcluido = await repository.excluirSetor(setor);
    if (foiExcluido) {
      listaDeSetores.removeWhere((element) => element == setor);
    }
  }

  void atualizarSetor(Setor setor) {
    repository.salvarSetor(setor);
  }
}
