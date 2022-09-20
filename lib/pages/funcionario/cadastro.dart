import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyForm createState() => _MyForm();
}

const List<String> listSetores = <String>[
  'Administrativo',
  'Atendimento',
  'B2B',
  'Conteúdo',
  'Departamento Pessoal',
  'ERP',
  'Expedição',
  'Financeiro',
  'Front-End',
  'Logística',
  'Marketing',
  'Produção',
  'Produtos',
  'Recuperação',
  'Retenção',
  'TI',
  'Vendas'
];

const List<String> listCargos = <String>[
  'Diretor',
  'Coordenador',
  'Analista',
  'Atendente',
  'Motorista',
  'Serviço Gerais',
  'Designer',
  'Auxiliar',
  'Supervisor',
  'Assistente',
  'Recepcionista',
  'Executiva',
  'Desenvolvedor Front End',
  'Assistente de retenção',
  'Analista de conteúdo',
  'Coordenador de Ti',
  'Coordenador ll',
  'Analista ll atendimento',
  'Analista de marketing',
  'Analista de marketing l',
  'Assistente de marketing',
  'Assistente de marketing ll',
  'Analista comercial Jr',
  'Assistente de atendimento',
  'Assistente de atendimento ll',
  'Analista SQL',
  'Lider de expedição',
  'Assistente de expedição',
  'Designer l',
  'Executiva de vendas',
  'Analista de e comerce l',
  'Auxiliar de logística',
  'Coordenador Logística',
  'Assistente de tecnologia',
  'Analista Financeiro',
  'Analista Comercial II',
  'Auxiliar de Serviços Gerais',
  'Assistente de Atendimento',
  'Supervisor de Expedição',
  'Assistente II e Atendimento',
  'Executivo de Vendas',
  'Assistente II de Expedição',
  'Assistente de Logística',
  'Assistente de Retenção II',
  'Coordenador de Recuperação',
  'Analista de Marketing II',
  'Coordenador de Expedição',
  'Analista de CRM',
  'Auxiliar Administrativo',
  'Assistente Financeiro',
  'Auxiliar de Escritório',
  'Analista de Mídias Pagas',
  'Assistente II de Tecnologia',
  'Analista de SEO',
  'Analista de Mídia',
  'Estagiário(a)',
  'Freela',
  'Consultor de SEO',
  'Assistente II',
  'Assistente Administrativo II',
  'Assistente de Produtos II',
  'Coordenador de Estoque',
  'Analista de Expedição',
  'Auxiliar de Estoque',
  'Coordenadora de Ecommerce',
  'Assistente de TI I',
  'Auxiliar de Produtos',
  'Auxiliar de Pagamento',
  'Assistente de Produto',
  'Analista de TI',
  'Auxiliar de Atendimento',
  'Assistente de Dados',
  'Lider de Produção',
  'Auxiliar de Produção',
  'Auxiliar de Expedição',
  'Designer II',
  'Coordenador de Expedição',
  'Analista Financeiro II',
  'Coordenador de Marketing',
  'Assistente de SEO',
  'Analista de Marketing (CRM)',
  'Vendas',
  'Assistente de Produção',
  'Analista de Relacionamento',
  'Assistente de Pagamentos',
  'Auxiliar de Recursos Humanos',
  'Pessoa Jurídica ',
  'Auxiliar de Limpeza',
  'Recepcionista',
];

class _MyForm extends State<Cadastro> {
  String valueSetor = listSetores.first;
  String valueCargo = listCargos.first;
  DateTime date = DateTime(2022, 09, 18);
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Funcionário'),
      ),
      body: ListView(
        children: [
          Stepper(
            physics: const ScrollPhysics(),
            currentStep: _index,
            onStepTapped: (step) {
              setState(() {
                _index = step;
              });
            },
            onStepContinue: () {
              setState(() {
                if (_index < _mySteps().length - 1) {
                  _index = _index + 1;
                } else {
                  //Logic to check if everything is completed
                  print('Completed, check fields.');
                }
              });
            },
            onStepCancel: () {
              setState(() {
                if (_index > 0) {
                  _index = _index - 1;
                } else {
                  _index = 0;
                }
              });
            },
            steps: _mySteps(),
          ),
        ],
      ),
    );
  }

  List<Step> _mySteps() {
    List<Step> steps = [
      Step(
        title: const Text('Dados Cadastrais'),
        content: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
             TextFormField(
              decoration: const InputDecoration(labelText: 'Idade'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Telefone'),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'CPF'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Rua'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Bairro'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Cidade'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Estado'),
            ),
          ],
        ),
        isActive: _index >= 0,
      ),
      Step(
        title: const Text('Dados Contratuais'),
        content: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text('Selecione o Setor'),
            ),
            SizedBox(
              width: 280,
              child: DropdownButton(
                isExpanded: true,
                value: valueSetor,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: listSetores.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    valueSetor = newValue!;
                  });
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text('Selecione o Cargo'),
            ),
            SizedBox(
              width: 280,
              child: DropdownButton(
                isExpanded: true,
                value: valueCargo,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: listCargos.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    valueCargo = newValue!;
                  });
                },
              ),
            ),
          ],
        ),
        isActive: _index >= 1,
      ),
    ];
    return steps;
  }
}
