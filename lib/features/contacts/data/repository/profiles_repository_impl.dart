// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/features/contacts/data/data_source/remote/contacts_data_source.dart';
import 'package:chat_app/features/contacts/data/model/profile_model.dart';
import 'package:chat_app/features/contacts/domain/entity/profile_entity.dart';
import 'package:chat_app/features/contacts/domain/repository/profiles_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ContactsDataSource contactsDataSource;
  ProfileRepositoryImpl({
    required this.contactsDataSource,
  });
  @override
  Future<DataState<List<ProfileEntity>>> fetchProfiles() async {
    List<Map<String, dynamic>> data;
    List<ProfileEntity> profiles;
    try {
      data = await contactsDataSource.getProfiles();
      profiles = data.map((e) => ProfileModel.fromMap(e)).toList();
      return DataSuccess(profiles);
    } catch (e) {
      return const DataFailed('Faild to load contacts');
    }
  }
}
