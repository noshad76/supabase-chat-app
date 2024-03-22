import 'package:bloc/bloc.dart';
import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/no_params.dart';
import 'package:chat_app/core/usecase/user_params.dart';
import 'package:chat_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:chat_app/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:chat_app/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:chat_app/features/authentication/presentation/bloc/bloc/login_status.dart';
import 'package:chat_app/features/authentication/presentation/bloc/bloc/logout_status.dart';
import 'package:chat_app/features/authentication/presentation/bloc/bloc/signup_status.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  LoginUsecase loginUsecase;
  SignUpUsecase signUpUsecase;
  LogoutUsecase logoutUsecase;

  AuthenticationBloc(
      {required this.loginUsecase,
      required this.logoutUsecase,
      required this.signUpUsecase})
      : super(AuthenticationState(
            loginStatus: LoginInitial(),
            logoutStatus: LogoutInitial(),
            signupStatus: SignupInitial())) {
    /// login event
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(newloginStatus: LoginLoading()));
      DataState dataState = await loginUsecase(
          UserParams(email: event.email, password: event.password));
      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newloginStatus: LoginDone(userCredential: dataState.data)));
      } else {
        emit(state.copyWith(
            newloginStatus: LoginError(error: dataState.error!)));
      }
    });

    /// logout event
    on<LogOutEvent>((event, emit) async {
      emit(state.copyWith(newlogoutStatus: LogoutLoading()));
      DataState dataState = await logoutUsecase.call(NoParam());
      if (dataState is DataSuccess) {
        emit(state.copyWith(newlogoutStatus: LogoutDone()));
      } else {
        emit(state.copyWith(
            newlogoutStatus: LogoutError(error: dataState.error!)));
      }
    });

    /// signup event
    on<SignupEvent>((event, emit) async {
      emit(state.copyWith(newsignupStatus: SignupLoading()));
      DataState dataState = await signUpUsecase(
          UserParams(email: event.email, password: event.password));
      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newsignupStatus: SignupDone(userCredential: dataState.data)));
      } else {
        emit(state.copyWith(
            newsignupStatus: SignupError(error: dataState.error!)));
      }
    });
  }
}
