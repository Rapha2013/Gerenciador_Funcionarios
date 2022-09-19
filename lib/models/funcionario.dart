class Funcionario {
  final int? id;
  final String nome;
  final String email;
  final int idade;
  final int telefone;
  final int cpf;
  final String rua;
  final String bairro;
  final String cidade;
  final String estado;
  final String setor;
  final String cargo;
  final String img;

  const Funcionario(
      {this.id,
      required this.nome,
      required this.email,
      required this.idade,
      required this.telefone,
      required this.cpf,
      required this.rua,
      required this.bairro,
      required this.cidade,
      required this.estado,
      required this.setor,
      required this.cargo,
      required this.img
      });
}
