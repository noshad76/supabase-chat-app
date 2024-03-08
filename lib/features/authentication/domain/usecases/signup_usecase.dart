// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/core/usecase/user_params.dart';
import 'package:chat_app/features/authentication/domain/repository/authentication_repository.dart';

class SignUpUsecase extends UseCase<DataState<UserCredential>, UserParams> {
  AuthenticationRepository authenticationRepository;
  SignUpUsecase({
    required this.authenticationRepository,
  });

  @override
  Future<DataState<UserCredential>> call(UserParams param) {
    return authenticationRepository.sigup(param.email, param.password);
  }
}
