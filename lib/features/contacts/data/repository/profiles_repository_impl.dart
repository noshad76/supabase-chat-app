// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/contacts/data/data_source/remote/contacts_data_source.dart';
import 'package:chat_app/features/contacts/domain/entity/profile_entity.dart';
import 'package:chat_app/features/contacts/domain/repository/profiles_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ContactsDataSource contactsDataSource;
  ProfileRepositoryImpl({
    required this.contactsDataSource,
  });
  @override
  Future<DataState<List<ProfileEntity>>> fetchProfiles() async {
    List<ProfileEntity> profiles;
    try {
      profiles = await contactsDataSource.getProfiles();
      return DataSuccess(profiles);
    } catch (e) {
      return const DataFailed('Faild to load contacts');
    }
  }
}
