import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserEntity extends Equatable {
  final AuthResponse authResponse;
  const UserEntity({
    required this.authResponse,
  });

  @override
  List<Object?> get props => [authResponse];
}
