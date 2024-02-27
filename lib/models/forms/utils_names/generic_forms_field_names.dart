enum GenericFormsFieldNames {
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

const Map<GenericFormsFieldNames, String> formFieldLabels = {
  GenericFormsFieldNames.nome: "Nome",
  GenericFormsFieldNames.email: "Email",
  GenericFormsFieldNames.username: "Username",
  GenericFormsFieldNames.password: "Senha",
  GenericFormsFieldNames.cpf: "CPF",
  GenericFormsFieldNames.telefone: "Telefone",
  GenericFormsFieldNames.descricao: "Descrição",
  GenericFormsFieldNames.genero: "Gênero",
  GenericFormsFieldNames.etapasDesenvolvimento: "Etapas de Desenvolvimento",
  GenericFormsFieldNames.aceitarTermos: "Aceitar Termos",
  GenericFormsFieldNames.dataNascimento: "Data de Nascimento",
};
