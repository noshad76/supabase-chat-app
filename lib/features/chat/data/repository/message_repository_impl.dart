// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/chat/data/data_source/remote/message_data_source.dart';
import 'package:chat_app/features/chat/domain/entity/message_entity.dart';
import 'package:chat_app/features/chat/domain/repository/message_repository.dart';

class MessageRepositoryImpl extends MessageRepository {
  MessageDataSource messageDataSource;
  MessageRepositoryImpl({
    required this.messageDataSource,
  });

  @override
  Stream<DataState<List<MessageEntity>>> getMessages() async* {
    try {
      final Stream<List<MessageEntity>> messagesStream =
          messageDataSource.getMessages();

      await for (final messages in messagesStream) {
        yield DataSuccess(messages);
      }
    } catch (e) {
      yield DataFailed('Failed to fetch messages: $e');
    }
  }
}
