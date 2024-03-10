
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationDataSource {
  final _supabase = Supabase.instance.client;

  //signin with google
  Future<AuthResponse> signIn(String email, String password) async {
    return await _supabase.auth
        .signInWithPassword(password: password, email: email);
  }

  //singup
  Future<AuthResponse> signUp(String email, String password) async {
    return await _supabase.auth.signUp(password: password, email: email);
  }

  //logout
  void logOut() async {
    await _supabase.auth.signOut();
  }
}
