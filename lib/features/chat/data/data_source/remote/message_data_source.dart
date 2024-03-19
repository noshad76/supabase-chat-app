// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:chat_app/features/chat/data/model/message_model.dart';
import 'package:chat_app/features/chat/domain/entity/message_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MessageDataSource {
  final SupabaseClient supabaseClient;
  const MessageDataSource({
    required this.supabaseClient,
  });

  Stream<List<MessageEntity>> getMessages() async* {
    final myUserId = supabaseClient.auth.currentUser!.id;
    yield* supabaseClient
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((maps) => maps
            .map((map) => MessageModel.fromMap(map: map, myUserId: myUserId))
            .toList());
  }

  Future sendMessage(String messageContent) async {
    final myUserId = supabaseClient.auth.currentUser!.id;
    await supabaseClient.from('messages').insert({
      'profile_id': myUserId,
      'content': messageContent,
    });
  }
}
