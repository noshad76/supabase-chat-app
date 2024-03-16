import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/no_params.dart';

import 'package:chat_app/features/authentication/data/data_source/authentication_data_source.dart';
import 'package:chat_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationDataSource authenticationDataSource;
  AuthenticationRepositoryImpl({
    required this.authenticationDataSource,
  });

  @override
  Future<DataState<AuthResponse>> login(String email, String password) async {
    AuthResponse userCredential;
    try {
      userCredential = await authenticationDataSource.signIn(email, password);
      return DataSuccess(userCredential);
    } catch (e) {
      return const DataFailed('Error during login');
    }
  }

  @override
  Future<DataState> logoOut() async {
    try {
      authenticationDataSource.logOut();
      return DataSuccess<NoParam>(NoParam());
    } catch (e) {
      return const DataFailed('logout faild');
    }
  }

  @override
  Future<DataState<AuthResponse>> sigup(String email, String password) async {
    AuthResponse userCredential;
    try {
      userCredential = await authenticationDataSource.signUp(email, password);
      return DataSuccess(userCredential);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
