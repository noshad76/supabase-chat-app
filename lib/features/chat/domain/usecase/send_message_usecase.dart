// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/chat/domain/repository/message_repository.dart';

class SendMessageUsecase {
  MessageRepository messageRepository;
  SendMessageUsecase({
    required this.messageRepository,
  });
  DataState call(String messageContent) {
   return messageRepository.sendMessage(messageContent);
  }
}
