// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'contacts_bloc.dart';

abstract class ContactsState extends Equatable {
  const ContactsState();

  @override
  List<Object> get props => [];
}

class ContactsLoading extends ContactsState {}

class ContactsDone extends ContactsState {
  final List<ProfileEntity> profiles;
  const ContactsDone({
    required this.profiles,
  });
}

class ContactsError extends ContactsState {
  final String error;
  const ContactsError({
    required this.error,
  });
}
