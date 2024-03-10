// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
 final LoginStatus? loginStatus;
 final LogoutStatus? logoutStatus;
 final SignupStatus? signupStatus;
 const AuthenticationState({
    required this.loginStatus,
    required this.logoutStatus,
    required this.signupStatus,
  });

  AuthenticationState copyWith({LoginStatus? newloginStatus,
      SignupStatus? newsignupStatus, LogoutStatus? newlogoutStatus}) {
    return AuthenticationState(
        loginStatus: newloginStatus ?? loginStatus,
        logoutStatus: newlogoutStatus ?? logoutStatus,
        signupStatus: newsignupStatus ?? signupStatus);
  }

  @override
  List<Object?> get props => [loginStatus, signupStatus, logoutStatus];
}
