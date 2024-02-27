import 'package:estudos/components/footer.dart';
import 'package:estudos/components/forms/budget_component.dart';
import 'package:estudos/components/header.dart';
import 'package:estudos/models/forms/utils_names/buget_field_name.dart';
import 'package:estudos/models/forms/utils_names/router_names_model.dart';
import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                title: 'Orçamento',
                onBack: () => Navigator.pop(context),
                onAvatarTap: () => Navigator.pushNamed(context, routePaths[RouteNames.profile]!),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DynamicBudgetComponent (
                  includeFields: const [
                    BudgetFieldNames.nome,
                    BudgetFieldNames.email,
                    BudgetFieldNames.cpf,
                    BudgetFieldNames.telefone,
                    BudgetFieldNames.dataNascimento,
                    BudgetFieldNames.descricao,
                    BudgetFieldNames.etapasDesenvolvimento,
                    BudgetFieldNames.aceitarTermos,
                  ].map((e) => formFieldLabels[e]!).toList(),
                   onFormSubmit: (Map<String, String> formData) {
                    print(
                        "Formulário submetido com os seguintes dados: $formData");
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
