import 'package:chat_app/core/resources/data_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:chat_app/features/authentication/data/data_source/authentication_data_source.dart';
import 'package:chat_app/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationDataSource authenticationDataSource;
  AuthenticationRepositoryImpl({
    required this.authenticationDataSource,
  });

  @override
  Future<DataState<UserCredential>> login(String email, String password) async {
    UserCredential userCredential;
    try {
      userCredential = await authenticationDataSource.signIn(email, password);
      return DataSuccess(userCredential);
    } catch (e) {
      return DataFailed('Error during login');
    }
  }

  @override
  void logoOut() async {
    authenticationDataSource.logOut();
  }

  @override
  Future<DataState<UserCredential>> sigup(String email, String password) async {
      UserCredential userCredential;
    try {
      userCredential = await authenticationDataSource.signUp(email, password);
      return DataSuccess(userCredential);
    } catch (e) {
      return DataFailed('Error during signup');
    }
  }
}
