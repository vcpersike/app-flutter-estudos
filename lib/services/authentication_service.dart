import 'package:openid_client/openid_client.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  Future<bool> login(String email, String password) async {
    try {
      var issuer = await Issuer.discover(Uri.parse('https://teste-de-login.caprover.gamboasolutions.com.br/realms/app-teste/broker/keycloak-oidc/endpoint'));
      var client = Client(issuer, '<clientId>');

      // Cria um autenticador
      var authenticator = Authenticator(client, scopes: ['openid', 'profile']);

      // Abre o navegador para realizar o login
      var c = await authenticator.authorize(); // Isso abrirá o navegador para o login

      // Fecha o navegador após a autenticação
      void closeWebView() {
        // Add your implementation here
      }

      // Você pode agora obter as informações do token ou do usuário
      var tokenResponse = await c.getTokenResponse();

      // O ideal é verificar a validade do token e extrair as informações necessárias dele
      var userInfo = await c.getUserInfo();

      // Aqui você pode realizar as verificações necessárias com as informações do usuário
      // Por exemplo, verificar se o e-mail recebido corresponde ao esperado

      return true;
    } catch (e) {
      print("Erro ao realizar o login: $e");
      return false;
    }
  }
}
