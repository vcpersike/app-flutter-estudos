import 'package:estudos/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel {
  final AuthenticationService _authService;

  LoginViewModel() : _authService = AuthenticationService(FirebaseAuth.instance);

  Future<bool> login(String email, String password) async {
    final String? errorMessage = await _authService.signIn(email: email, password: password);
    return errorMessage == null;
  }

}

class LogoutViewModel {
  final AuthenticationService _authenticationService;

  LogoutViewModel(this._authenticationService);

  Future<void> logout(BuildContext context) async {
    await _authenticationService.signOut();
    Navigator.pushReplacementNamed(context, '/');
  }
}

class AuthenticationViewModel {
  final AuthenticationService _authenticationService;

  AuthenticationViewModel(this._authenticationService);

  Future<bool> checkAuthentication() async {
    return await _authenticationService.isAuthenticated();
  }
}
