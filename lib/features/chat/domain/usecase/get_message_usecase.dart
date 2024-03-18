// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/core/resources/data_state.dart';

import 'package:chat_app/features/chat/domain/entity/message_entity.dart';
import 'package:chat_app/features/chat/domain/repository/message_repository.dart';

class GetMessageUsecase {
  MessageRepository messageRepository;
  GetMessageUsecase({
    required this.messageRepository,
  });

  Stream<DataState<List<MessageEntity>>> call() async* {
    yield* messageRepository.getMessages();
  }
}
