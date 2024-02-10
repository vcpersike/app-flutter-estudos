import '../services/authentication_service.dart';

class LoginViewModel {
  final AuthenticationService _authService = AuthenticationService();

  Future<bool> login(String email, String password) async {
    return await _authService.login(email, password);
  }
}
