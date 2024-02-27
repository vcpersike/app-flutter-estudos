// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers

import 'package:estudos/components/forms/register_client_component.dart';
import 'package:estudos/models/forms/utils_names/router_names_model.dart';
import 'package:estudos/viewmodels/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:estudos/components/header.dart';
import 'package:estudos/models/forms/utils_names/generic_forms_field_names.dart';
import 'package:estudos/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterClientPage extends StatelessWidget {
  const RegisterClientPage({super.key});

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
            Navigator.pushReplacementNamed(context, routePaths[RouteNames.login]!);
          });
          return const SizedBox.shrink();
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
                title: 'Registro de Cliente',
                onBack: () => Navigator.pop(context),
                onAvatarTap: () =>
                    Navigator.pushNamed(context, routePaths[RouteNames.profile]!),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DynamicRegisterClientComponent(
                  includeFields: const [
                    GenericFormsFieldNames.nome,
                    GenericFormsFieldNames.email,
                    GenericFormsFieldNames.cpf,
                    GenericFormsFieldNames.telefone,
                    GenericFormsFieldNames.dataNascimento,
                    GenericFormsFieldNames.descricao,
                    GenericFormsFieldNames.etapasDesenvolvimento,
                    GenericFormsFieldNames.aceitarTermos,
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
