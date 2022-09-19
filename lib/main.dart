import 'package:client_app/data/dummy_funcionarios.dart';
import 'package:client_app/pages/funcionario/cadastro.dart';
import 'package:client_app/pages/funcionario/editar.dart';
import 'package:client_app/pages/funcionario/lista.dart';
import 'package:client_app/pages/menu.dart';
import 'package:client_app/provider/funcionarios.dart';
import 'package:client_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'components/funcionario_tile.dart';

void main() {
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
  final funcionariosList = {...DUMMY_FUNCIONARIOS};

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Funcionarios(),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cadastro()),
              );
            },
            child: const Icon(
              Icons.add,
            ),
          ),
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
                        )),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Lista()));
                              },
                              child: const Text(
                                "Ver todos",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ultrimosCadastrados(),
            ],
          ),
        ),
        routes: {
          AppRoutes.FUNCIONARIO_EDIT: (_) => EditarFuncionario()
        },
      ),
    );
  }

  SizedBox ultrimosCadastrados() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) => FuncionarioTile(
            funcionario: funcionariosList.values.elementAt(index)),
      ),
    );
  }
}
