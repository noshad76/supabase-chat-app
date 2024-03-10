
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SignupStatus extends Equatable {}

class SignupLoading extends SignupStatus {
  @override
  List<Object?> get props => [];
}

class SignupInitial extends SignupStatus {
  @override
  List<Object?> get props => [];
}

class SignupDone extends SignupStatus {
  final AuthResponse userCredential;
  SignupDone({
    required this.userCredential,
  });
  @override
  List<Object?> get props => [userCredential];
}

class SignupError extends SignupStatus {
  final String error;

  SignupError({required this.error});

  @override
  List<Object?> get props => [error];
}
