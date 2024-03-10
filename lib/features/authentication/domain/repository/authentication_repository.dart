import 'package:chat_app/core/resources/data_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthenticationRepository {
  Future<DataState<AuthResponse>> login(String email,String password);
  Future<DataState<AuthResponse>> sigup(String email,String password);
  Future<DataState> logoOut();
}
