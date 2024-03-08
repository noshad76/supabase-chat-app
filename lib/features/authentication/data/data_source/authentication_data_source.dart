import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //signin with google
  Future<UserCredential> signIn(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //singup
  Future<UserCredential> signUp(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  //logout
  void logOut() async {
    await _firebaseAuth.signOut();
  }
}
