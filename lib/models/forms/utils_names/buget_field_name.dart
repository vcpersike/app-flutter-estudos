enum BudgetFieldNames {
  nome,
  email,
  username,
  password,
  cpf,
  telefone,
  descricao,
  genero,
  etapasDesenvolvimento,
  aceitarTermos,
  dataNascimento,
}

const Map<BudgetFieldNames, String> formFieldLabels = {
  BudgetFieldNames.nome: "Nome",
  BudgetFieldNames.email: "Email",
  BudgetFieldNames.username: "Username",
  BudgetFieldNames.password: "Senha",
  BudgetFieldNames.cpf: "CPF",
  BudgetFieldNames.telefone: "Telefone",
  BudgetFieldNames.descricao: "Descrição",
  BudgetFieldNames.genero: "Gênero",
  BudgetFieldNames.etapasDesenvolvimento: "Etapas de Desenvolvimento",
  BudgetFieldNames.aceitarTermos: "Aceitar Termos",
  BudgetFieldNames.dataNascimento: "Data de Nascimento",
};
