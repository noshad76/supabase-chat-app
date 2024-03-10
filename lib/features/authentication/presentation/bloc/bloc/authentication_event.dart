part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;
  LoginEvent({
    required this.email,
    required this.password,
  });
}

class SignupEvent extends AuthenticationEvent {
  final String email;
  final String password;
  SignupEvent({
    required this.email,
    required this.password,
  });
}

class LogOutEvent extends AuthenticationEvent {}
