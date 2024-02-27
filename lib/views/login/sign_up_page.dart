// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, sort_child_properties_last, library_private_types_in_public_api

import 'package:estudos/models/forms/utils_names/generic_forms_field_names.dart';
import 'package:estudos/models/forms/utils_names/router_names_model.dart';
import 'package:estudos/viewmodels/sign_up_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:estudos/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final SignUpViewModel _viewModel = SignUpViewModel(AuthenticationService(FirebaseAuth.instance));

  Future<void> _signUp() async {
    final String? errorMessage = await _viewModel.signUp(
      email: _emailController.text,
      password: _passwordController.text,
      fullName: _fullNameController.text,
    );

    if (errorMessage == null) {
      Navigator.pushReplacementNamed(context, routePaths[RouteNames.login]!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Icon(Icons.rocket_launch, size: 100, color: Theme.of(context).primaryColor),
                ),
                _buildTextField(
                  controller: _fullNameController,
                  label: formFieldLabels[GenericFormsFieldNames.nome]!,
                ),
                _buildTextField(
                  controller: _emailController,
                  label: formFieldLabels[GenericFormsFieldNames.email]!,
                  keyboardType: TextInputType.emailAddress,
                ),
                _buildTextField(
                  controller: _passwordController,
                  label: formFieldLabels[GenericFormsFieldNames.password]!,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _signUp,
                  child: Text('Cadastrar'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 36),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }
}
