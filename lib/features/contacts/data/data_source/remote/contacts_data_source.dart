
import 'package:supabase_flutter/supabase_flutter.dart';

class ContactsDataSource {
  final SupabaseClient client;
  ContactsDataSource({
    required this.client,
  });

  Future<List<Map<String,dynamic>>> getProfiles() async {
    List<Map<String, dynamic>> data = await client.from('profiles').select();

    return data;
  }
}
