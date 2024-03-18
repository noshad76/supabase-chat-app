import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  const MessageEntity({
    required this.id,
    required this.profileId,
    required this.content,
    required this.createdAt,
    required this.isMine,
  });

  /// ID of the message
  final String id;

  /// ID of the user who posted the message
  final String profileId;

  /// Text content of the message
  final String content;

  /// Date and time when the message was created
  final DateTime createdAt;

  /// Whether the message is sent by the user or not.
  final bool isMine;
  
  @override
  List<Object?> get props => [id,profileId,content,createdAt,isMine];

}
