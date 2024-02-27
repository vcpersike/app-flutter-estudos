import 'package:estudos/DB/db_firestore.dart';
import 'package:estudos/models/register_client_model.dart';

class RegisterClientViewModel {
  Future<void> registerClient(RegisterClientModel user) async {
    try {
      await DBFirestore.get().collection('clients').add(user.toMap());
      // Implemente aqui o tratamento após o sucesso, se necessário.
    } catch (e) {
      // Trate o erro conforme necessário
      print("Erro ao registrar cliente: $e");
    }
  }
}
