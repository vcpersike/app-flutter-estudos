class AuthenticationService {
  Future<bool> login(String email, String password) async {

    await Future.delayed(const Duration(seconds: 1));
    return email == 'user@example.com' && password == 'password';
  }
}
