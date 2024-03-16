// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationDataSource {
  SupabaseClient supabaseClient;
  AuthenticationDataSource({
    required this.supabaseClient,
  });

  //signin with google
  Future<AuthResponse> signIn(String email, String password) async {
    return await supabaseClient.auth
        .signInWithPassword(password: password, email: email);
  }

  //singup
  Future<AuthResponse> signUp(String email, String password) async {
    return await supabaseClient.auth.signUp(
      password: password,
      email: email,
    );
  }

  //logout
  void logOut() async {
    await supabaseClient.auth.signOut();
  }
}
