
import 'package:equatable/equatable.dart';

abstract class LogoutStatus extends Equatable {}

class LogoutLoading extends LogoutStatus {
  @override
  List<Object?> get props => [];
}

class LogoutInitial extends LogoutStatus {
  @override
  List<Object?> get props => [];
}

class LogoutDone extends LogoutStatus {
  
  @override
  List<Object?> get props => [];
}

class LogoutError extends LogoutStatus {
  final String error;

  LogoutError({required this.error});

  @override
  List<Object?> get props => [error];
}
