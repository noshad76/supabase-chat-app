import 'package:chat_app/core/resources/data_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<DataState<UserCredential>> login(String email,String password);
  Future<DataState<UserCredential>> sigup(String email,String password);
  void logoOut();
}
