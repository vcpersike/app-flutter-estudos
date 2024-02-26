// ignore_for_file: avoid_print

import 'package:estudos/models/router_names.dart';
import 'package:estudos/viewmodels/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:estudos/components/forms_component.dart';
import 'package:estudos/components/header.dart';
import 'package:estudos/models/form_field_names.dart';
import 'package:estudos/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PdfPage extends StatelessWidget {
  const PdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationService _authenticationService =
        AuthenticationService(FirebaseAuth.instance);
    final AuthenticationViewModel _authenticationViewModel =
        AuthenticationViewModel(_authenticationService);

    return FutureBuilder<bool>(
      future: _authenticationViewModel.checkAuthentication(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasData && snapshot.data!) {
          return _buildAuthenticatedContent(context);
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, '/');
          });
          return SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildAuthenticatedContent(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                title: 'PDF',
                onBack: () => Navigator.pop(context),
                onAvatarTap: () =>
                    Navigator.pushNamed(context, routePaths[RouteNames.profile]!),
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
                    print(
                        "Formulário submetido com os seguintes dados: $formData");
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
