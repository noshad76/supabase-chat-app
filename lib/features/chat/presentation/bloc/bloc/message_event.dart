// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class GetMessages extends MessageEvent {}

class SendMessage extends MessageEvent {
 final String messageContent;
 const SendMessage({
    required this.messageContent,
  });
}
