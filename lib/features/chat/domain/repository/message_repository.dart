import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/chat/domain/entity/message_entity.dart';

abstract class MessageRepository {
  Stream<DataState<List<MessageEntity>>> getMessages();
}
