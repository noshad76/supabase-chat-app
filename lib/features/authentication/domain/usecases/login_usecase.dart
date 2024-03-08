import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/core/usecase/user_params.dart';
import 'package:chat_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUsecase extends UseCase<DataState<UserCredential>,UserParams> {
  AuthenticationRepository authenticationRepository;
  LoginUsecase({
    required this.authenticationRepository,
  });
  

  @override
  Future<DataState<UserCredential>> call(UserParams param)async {
   return await authenticationRepository.login(param.email, param.password);
  }
}
