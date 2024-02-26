class UserRegister {
  String nome;
  String telefone;
  String cpf;
  DateTime dataNascimento;
  String genero;
  bool aceitaTermos;

  UserRegister({
    required this.nome,
    required this.telefone,
    required this.cpf,
    required this.dataNascimento,
    required this.genero,
    this.aceitaTermos = false,
  });
}
