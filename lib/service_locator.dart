import 'package:chat_app/features/authentication/data/data_source/authentication_data_source.dart';
import 'package:chat_app/features/authentication/data/repository/authentication_repository_impl.dart';
import 'package:chat_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:chat_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:chat_app/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:chat_app/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:chat_app/features/authentication/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:get_it/get_it.dart';

var instance = GetIt.instance;

Future<void> initializeLocator() async {
  instance
      .registerSingleton<AuthenticationDataSource>(AuthenticationDataSource());

  instance.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(authenticationDataSource: instance()));

  instance.registerSingleton<LoginUsecase>(
      LoginUsecase(authenticationRepository: instance()));
  instance.registerSingleton<LogoutUsecase>(
      LogoutUsecase(authenticationRepository: instance()));
  instance.registerSingleton<SignUpUsecase>(
      SignUpUsecase(authenticationRepository: instance()));

  instance.registerSingleton<AuthenticationBloc>(AuthenticationBloc(
      loginUsecase: instance(),
      logoutUsecase: instance(),
      signUpUsecase: instance()));
}
