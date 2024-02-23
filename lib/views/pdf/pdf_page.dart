import 'package:estudos/components/forms_component.dart';
import 'package:estudos/components/footer.dart';
import 'package:estudos/components/header.dart';
import 'package:estudos/models/form_field_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PdfPage extends StatelessWidget {
  const PdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                title: 'PDF',
                onBack: () => Navigator.pop(context),
                onAvatarTap: () => Navigator.pushNamed(context, '/perfil'),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DynamicFormComponent(
                  includeFields: const [
                    FormFieldNames.nome,
                    FormFieldNames.email,
                    FormFieldNames.cpf,
                    FormFieldNames.telefone,
                    FormFieldNames.dataNascimento,
                    FormFieldNames.descricao,
                    FormFieldNames.etapasDesenvolvimento,
                    FormFieldNames.aceitarTermos,
                  ].map((e) => formFieldLabels[e]!).toList(),
                  onFormSubmit: (Map<String, String> formData) {
                    print("Formulário submetido com os seguintes dados: $formData");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
