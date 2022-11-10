
import 'package:client_app/models_views/funcionario_store.dart';
import 'package:client_app/views/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = 'xuCoPAunHagdkOwZvB7YYPoIDjEZMfD9vqoZmObE';
  final keyClientKey = '6k21mO87iRZ4LIjxyH2XdEfRdNCeF8jIRycmEifm';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FuncionarioStore funcionarioStore = FuncionarioStore();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          title: const Text("Início"),
        ),
        drawer: const Drawer(child: MenuItens()),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Image(
                image: AssetImage('assets/images/gerenciador-tarefas.jpg')),
            // ignore: avoid_unnecessary_containers
            const SizedBox(
              height: 80.0,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
                child: Center(
                    child: Text('Gerenciador de Funcionarios',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text('Ultimos Cadastrados!'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ultrimosCadastrados(),
          ],
        ),
      ),
    );
  }

  SizedBox ultrimosCadastrados() {
    return SizedBox(
      height: 220,
      child: Observer(builder: (_) {
        if (funcionarioStore.isCarregando) {
          return const Center(
            child: SizedBox(
                width: 100, height: 100, child: CircularProgressIndicator()),
          );
        }

        if (funcionarioStore.listaDeFuncionarios.isEmpty) {
          return const Center(
            child: SizedBox(
              width: 300,
              height: 100,
              child: Text(
                "Nenhum funcionario cadastrado!",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.only(top: 10.0),
          itemCount: funcionarioStore.listaDeFuncionarios.length,
          itemBuilder: (context, index) {
            final funcionarios = funcionarioStore.listaDeFuncionarios[index];

            ///Serve para atualizar o item
            return Observer(builder: (_) {
              return ListTile(
                title: Text(funcionarios.nome),
                subtitle: Text(funcionarios.idSetor),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: (() {
                            print('ver fun');
                          }),
                          icon: const Icon(Icons.edit, color: Colors.orange)),
                      IconButton(
                          onPressed: (() {
                            print('ver fun');
                          }),
                          icon: const Icon(Icons.delete, color: Colors.red))
                    ],
                  ),
                ),
              );
            });
          },
        );
      }),
    );
  }
}
