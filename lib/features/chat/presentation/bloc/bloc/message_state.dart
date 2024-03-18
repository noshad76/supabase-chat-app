// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'message_bloc.dart';

abstract class MessageState extends Equatable {
  @override
  List<Object> get props => [];
}

class MessageLoading extends MessageState {}

class MessageDone extends MessageState {
  final List<MessageEntity> messages;
  MessageDone({
    required this.messages,
  });
  @override
  List<Object> get props => [messages];
}

class MessageFaild extends MessageState {
 final String error;
  MessageFaild({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}
