import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/core/usecase/user_params.dart';
import 'package:chat_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginUsecase extends UseCase<DataState<AuthResponse>,UserParams> {
  AuthenticationRepository authenticationRepository;
  LoginUsecase({
    required this.authenticationRepository,
  });
  

  @override
  Future<DataState<AuthResponse>> call(UserParams param)async {
   return await authenticationRepository.login(param.email, param.password);
  }
}
