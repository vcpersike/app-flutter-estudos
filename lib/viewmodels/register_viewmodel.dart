 import 'package:estudos/models/register_field.dart';
import 'package:estudos/services/register_service.dart';

class RegisterViewModel {
  final UserService _userService = UserService();
  final UserRegister user = UserRegister(
    nome: '', telefone: '', cpf: '', dataNascimento: DateTime.now(), genero: 'Não informado', aceitaTermos: false);

  Future<void> saveUser() async {
    try {
      await _userService.addRegister(user);
      // Aqui você pode adicionar lógica após o sucesso da operação, como navegação ou exibição de uma mensagem de sucesso.
    } catch (e) {
      // Tratar erros, como mostrar uma mensagem de erro ao usuário.
      print(e.toString());
    }
  }
}
