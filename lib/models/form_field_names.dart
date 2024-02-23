// Definição do enum e do mapa
enum FormFieldNames {
  nome,
  email,
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
  FormFieldNames.cpf: "CPF",
  FormFieldNames.telefone: "Telefone",
  FormFieldNames.descricao: "Descrição",
  FormFieldNames.genero: "Gênero",
  FormFieldNames.etapasDesenvolvimento: "Etapas de Desenvolvimento",
  FormFieldNames.aceitarTermos: "Aceitar Termos",
  FormFieldNames.dataNascimento: "Data de Nascimento",
};
