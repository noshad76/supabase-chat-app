// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'message_bloc.dart';

class MessageState extends Equatable {
  final GetMessageStatus getMessageStatus;
  final SendMessageStatus sendMessageStatus;
  const MessageState({
    required this.getMessageStatus,
    required this.sendMessageStatus,
  });

   MessageState copyWith({GetMessageStatus? newGetMessageStatus,
      SendMessageStatus? newSendMessageStatus}) {
    return MessageState(
        getMessageStatus: newGetMessageStatus ?? getMessageStatus,
        sendMessageStatus: newSendMessageStatus ?? sendMessageStatus);
  }

  @override
  List<Object> get props => [getMessageStatus,sendMessageStatus];
}
