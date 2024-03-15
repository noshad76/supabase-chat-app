import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/contacts/domain/entity/profile_entity.dart';

abstract class ProfileRepository {
   Future<DataState<List<ProfileEntity>>> fetchProfiles();
}
