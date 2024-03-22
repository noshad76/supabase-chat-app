import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/authentication/domain/repository/authentication_repository.dart';

class LogoutUsecase {
  AuthenticationRepository authenticationRepository;
  LogoutUsecase({
    required this.authenticationRepository,
  });
  Future<DataState<dynamic>> call(param) {
    return authenticationRepository.logoOut();
  }
}
