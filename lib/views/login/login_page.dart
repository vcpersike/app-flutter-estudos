
// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:estudos/models/form_field_names.dart';
import 'package:estudos/models/router_names.dart';
import 'package:flutter/material.dart';
import 'package:estudos/viewmodels/login_viewmodel.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({super.key, required this.title});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginViewModel _viewModel = LoginViewModel();

  Future<void> _login() async {
    final bool loginSuccess = await _viewModel.login(
      _emailController.text,
      _passwordController.text,
    );

    if (loginSuccess) {
      Navigator.pushReplacementNamed(context, routePaths[RouteNames.menu]!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Falha na autenticação')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Icon(
                    Icons
                        .rocket_launch,
                    size: 100.0,
                    color: Theme.of(context)
                        .primaryColor
                    ),
              ),

              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: formFieldLabels[FormFieldNames.email]),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: formFieldLabels[FormFieldNames.password]),
                obscureText: true,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, routePaths[RouteNames.signUp]!);
                },
                child: const Text(
                  'Não tem uma conta? Cadastre-se',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
