// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/features/contacts/data/model/profile_model.dart';
import 'package:chat_app/features/contacts/domain/entity/profile_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ContactsDataSource {
  final SupabaseClient client;
  ContactsDataSource({
    required this.client,
  });

  Future<List<ProfileEntity>> getProfiles() async {
    List<Map<String, dynamic>> data = await client.from('profiles').select();

    return data.map((e) => ProfileModel.fromMap(e)).toList();
  }
}
