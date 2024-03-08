// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserEntity extends Equatable {
 final UserCredential userCredential;
 const UserEntity({
    required this.userCredential,
  });
  
  @override
  List<Object?> get props =>[userCredential];
}
