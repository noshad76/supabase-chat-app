import 'package:chat_app/features/chat/domain/entity/message_entity.dart';

class MessageModel extends MessageEntity {
  const MessageModel({
    required super.id,
    required super.profileId,
    required super.content,
    required super.createdAt,
    required super.isMine,
  });

 static MessageEntity fromMap({
    required Map<String, dynamic> map,
    required String myUserId,
  }) {
    return MessageEntity(
        id: map['id'],
        profileId: map['profile_id'],
        content: map['content'],
        createdAt: DateTime.parse(map['created_at']),
        isMine: myUserId == map['profile_id']);
  }
}
