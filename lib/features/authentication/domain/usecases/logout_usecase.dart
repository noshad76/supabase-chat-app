
import 'package:chat_app/features/authentication/domain/repository/authentication_repository.dart';

class LogoutUsecase {
  AuthenticationRepository authenticationRepository;
  LogoutUsecase({
    required this.authenticationRepository,
  });
  call(param) {
    authenticationRepository.logoOut();
  }
}
