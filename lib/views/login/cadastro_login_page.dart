import 'package:estudos/models/form_field_names.dart';
import 'package:estudos/models/router_names.dart';
import 'package:estudos/viewmodels/cadastro_login_viewmodel.dart';
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
      appBar: AppBar(title: Text('Cadastro')),
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
                  label: formFieldLabels[FormFieldNames.nome]!,
                ),
                _buildTextField(
                  controller: _emailController,
                  label: formFieldLabels[FormFieldNames.email]!,
                  keyboardType: TextInputType.emailAddress,
                ),
                _buildTextField(
                  controller: _passwordController,
                  label: formFieldLabels[FormFieldNames.password]!,
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _signUp,
                  child: Text('Cadastrar'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 36),
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
