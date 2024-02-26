import 'package:estudos/components/forms_component.dart';
import 'package:estudos/components/footer.dart';
import 'package:estudos/components/header.dart';
import 'package:estudos/models/router_names.dart';
import 'package:flutter/material.dart';

class ExcelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                title: 'Excel',
                onBack: () => Navigator.pop(context),
                onAvatarTap: () => Navigator.pushNamed(context, routePaths[RouteNames.profile]!),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DynamicFormComponent(
                  includeFields: const [
                    'Nome',
                    'Telefone',
                    'CPF',
                    'Descrição',
                    'Aceitar Termos',
                    'Data de Nascimento',
                    'Gênero'
                  ],
                  onFormSubmit: (Map<String, String> formData) {
                    print("Formulário submetido com os seguintes dados: $formData");
                  },
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
