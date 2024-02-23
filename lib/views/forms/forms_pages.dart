import 'package:estudos/components/footer.dart';
import 'package:estudos/components/forms_component.dart';
import 'package:estudos/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormsPage extends StatefulWidget {
  @override
  _FormsPageState createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cpfController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Dados do Cadastro'),
            content: Text(
              'Nome: ${_nameController.text}\n'
              'Endereço: ${_addressController.text}\n'
              'CPF: ${_cpfController.text}\n'
              'Descrição: ${_descriptionController.text}',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
              child: Padding(
                padding: EdgeInsets.zero,
                child: Header(title: 'Formulários',
                onBack: () => Navigator.pop(context),
                onAvatarTap: () => Navigator.pushNamed(context, '/perfil'),
                ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DynamicFormComponent(
                includeFields: const [
                  'Nome',
                  'Telefone',
                  'CPF',
                  'Email',
                  'Etapas de Desenvolvimento',
                  'Data de Nascimento',
                ],
                onFormSubmit: (Map<String, String> formData) {
                  print(
                      "Formulário submetido com os seguintes dados: $formData");
                },
              ),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
