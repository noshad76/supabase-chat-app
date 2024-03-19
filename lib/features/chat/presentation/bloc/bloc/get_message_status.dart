import 'package:chat_app/features/chat/domain/entity/message_entity.dart';
import 'package:equatable/equatable.dart';
 
abstract class GetMessageStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetMessageLoading extends GetMessageStatus {}

class GetMessageDone extends GetMessageStatus {
  final List<MessageEntity> messages;
  GetMessageDone({
    required this.messages,
  });
  @override
  List<Object> get props => [messages];
}

class GetMessageFaild extends GetMessageStatus {
  final String error;
  GetMessageFaild({
    required this.error,
  });
  @override
  List<Object> get props => [error];
}
