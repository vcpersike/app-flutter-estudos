import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estudos/models/forms/user_sing_up_model.dart';

class SingUpService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addSingUp(UserSingUp user) async {
    try {
      await _firebaseFirestore.collection('users').add({
        'nome': user.nome,
        'telefone': user.telefone,
        'cpf': user.cpf,
        'dataNascimento': user.dataNascimento.toIso8601String(),
        'genero': user.genero,
        'aceitaTermos': user.aceitaTermos,
      });
    } catch (e) {
      // Tratar exceções ou erros aqui
      print(e.toString());
    }
  }

  // Aqui você pode adicionar mais métodos conforme necessário, por exemplo, para buscar usuários.
}
