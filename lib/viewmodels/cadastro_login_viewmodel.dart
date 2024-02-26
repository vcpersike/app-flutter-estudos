import 'package:estudos/services/authentication_service.dart';

class SignUpViewModel {
  final AuthenticationService _authService;

  SignUpViewModel(this._authService);

  Future<String?> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    // Implemente a lógica de cadastro aqui, chamando o método correspondente
    // do AuthenticationService e retorne qualquer mensagem de erro se necessário.
    return await _authService.signUp(
      email: email,
      password: password,
      fullName: fullName,
    );
  }
}
