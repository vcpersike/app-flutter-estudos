import 'package:estudos/DB/db_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);


  Future<String?> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Nenhum usuário encontrado para esse e-mail.';
      } else if (e.code == 'wrong-password') {
        return 'Senha incorreta fornecida para esse e-mail.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

 Future<String?> signUp({required String email, required String password, required String fullName}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      FirebaseFirestore firestore = DBFirestore.get();

      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'fullName': fullName,
        'email': email,
        'accountCreated': FieldValue.serverTimestamp(),
        // Você pode adicionar mais campos conforme necessário
      });

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'A senha fornecida é muito fraca.';
      } else if (e.code == 'email-already-in-use') {
        return 'Já existe uma conta com esse endereço de e-mail.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<bool> isAuthenticated() async {
    var user = _firebaseAuth.currentUser;
    return user != null;
  }
}
