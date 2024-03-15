import 'package:chat_app/features/contacts/domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.id,
    required super.username,
    required super.createdAt,
  });

 static ProfileEntity fromMap(Map<String, dynamic> map) => ProfileModel(
      id: map['id'],
      username: map['username'],
      createdAt: DateTime.parse(map['created_at']));
}
