import 'package:firebase_auth/firebase_auth.dart';

class FireAuthController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  Future<void> signUp({
    required String userName,
    required String email,
    required String password,
  }) async {

    UserCredential user =
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
      password: password,
    );
  }

  Future<void> login({required String email, required String password}) async {
    await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }


}
