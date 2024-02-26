enum FormFieldNames {
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

const Map<FormFieldNames, String> formFieldLabels = {
  FormFieldNames.nome: "Nome",
  FormFieldNames.email: "Email",
  FormFieldNames.username: "Username",
  FormFieldNames.password: "Senha",
  FormFieldNames.cpf: "CPF",
  FormFieldNames.telefone: "Telefone",
  FormFieldNames.descricao: "Descrição",
  FormFieldNames.genero: "Gênero",
  FormFieldNames.etapasDesenvolvimento: "Etapas de Desenvolvimento",
  FormFieldNames.aceitarTermos: "Aceitar Termos",
  FormFieldNames.dataNascimento: "Data de Nascimento",
};
