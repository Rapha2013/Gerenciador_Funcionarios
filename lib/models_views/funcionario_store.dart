import 'package:client_app/models/cargo.dart';
import 'package:client_app/models/funcionario.dart';
import 'package:client_app/models/setor.dart';
import 'package:client_app/repositories/funcionario_repository.dart';
import 'package:mobx/mobx.dart';

//flutter pub run build_runner build
part 'funcionario_store.g.dart';

class FuncionarioStore = _FuncionarioStore with _$FuncionarioStore;

abstract class _FuncionarioStore with Store {
  _FuncionarioStore() {
    carregarFuncionarios();
  }

  FuncionarioRepository repository = FuncionarioRepository();

  @observable
  ObservableList<Funcionario> listaDeFuncionarios = ObservableList();

  @observable
  ObservableFuture<List<Funcionario>> obsFuture = ObservableFuture.value([]);

  @computed
  bool get isCarregando {
    return obsFuture.status == FutureStatus.pending;
  }

  @action
  Future<void> carregarFuncionarios() async {
    final futureList = repository.listarFuncionarios();
    obsFuture = ObservableFuture(futureList);
    final funcionarios = await futureList;
    listaDeFuncionarios.addAll(funcionarios);
  }

  @action
  Future<void> salvarFuncionario(String nome, String email, int idade,
      String idCargo, String idSetor) async {
    final funcionario = await repository
        .salvarFuncionario(Funcionario(nome, email, idade, idSetor, idCargo));
    if (funcionario != null) {
      listaDeFuncionarios.add(funcionario);
    }
  }

  @action
  Future<void> excluirFuncionario(Funcionario funcionario) async {
    final foiExcluido = await repository.excluirFuncionario(funcionario);
    if (foiExcluido) {
      listaDeFuncionarios.removeWhere((element) => element == funcionario);
    }
  }

  void atualizarFuncionario(Funcionario funcionario) {
    repository.salvarFuncionario(funcionario);
  }
}
