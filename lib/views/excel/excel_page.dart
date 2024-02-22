import 'package:estudos/components/forms_component.dart';
import 'package:estudos/components/footer.dart';
import 'package:estudos/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExcelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Header(
              title: 'Excel',
              onBack: () => Navigator.pop(context),
              onAvatarTap: () => Navigator.pushNamed(context, '/perfil'),
            ),
          ),
          Expanded(
            child: DynamicFormComponent(
              includeFields: ['Nome', 'Telefone', 'Aceitar Termos', 'Data de Nascimento'],
              onFormSubmit: (Map<String, String> formData) {
                print("Formulário submetido com os seguintes dados: $formData");
              },
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
