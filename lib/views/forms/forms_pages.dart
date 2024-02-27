import 'package:estudos/components/footer.dart';
import 'package:estudos/components/forms_component.dart';
import 'package:estudos/components/header.dart';
import 'package:flutter/material.dart';

class FormsPage extends StatefulWidget {
  @override
  _FormsPageState createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // Garantir que o conteúdo não ultrapasse áreas inseguras
        child: SingleChildScrollView( // Permitir rolagem
          child: Column(
            children: [
              Header(
                title: 'Formulários',
                onBack: () => Navigator.pop(context),
                onAvatarTap: () => Navigator.pushNamed(context, '/perfil'),
              ),
              Padding(
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
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Dados do Cadastro'),
                          content: SingleChildScrollView( // Se necessário para exibir todos os dados
                            child: ListBody(
                              children: formData.entries
                                  .map((entry) => Text('${entry.key}: ${entry.value}'))
                                  .toList(),
                            ),
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
