import 'package:estudos/components/footer.dart';
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
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                                            TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(labelText: 'Nome'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu nome';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(labelText: 'Endereço'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu endereço';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _cpfController,
                        decoration: InputDecoration(labelText: 'CPF'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu CPF';
                          }
                          return null;
                        },
                      ),

                      // Outros TextFormField para Nome, Endereço, CPF
                      TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          labelText: 'Descrição',
                        ),
                        maxLength: 700,
                        maxLines: null, // Permite várias linhas
                        keyboardType: TextInputType.multiline,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira uma descrição';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          child: Text('Enviar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
