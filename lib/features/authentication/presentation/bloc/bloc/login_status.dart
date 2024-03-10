import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LoginStatus extends Equatable {}

class LoginLoading extends LoginStatus {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginStatus {
  @override
  List<Object?> get props => [];
}

class LoginDone extends LoginStatus {
  final AuthResponse userCredential;
  LoginDone({
    required this.userCredential,
  });
  @override
  List<Object?> get props => [userCredential];
}

class LoginError extends LoginStatus {
  final String error;

  LoginError({required this.error});

  @override
  List<Object?> get props => [error];
}
