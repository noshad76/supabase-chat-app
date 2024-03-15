// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/no_params.dart';
import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/features/contacts/domain/entity/profile_entity.dart';
import 'package:chat_app/features/contacts/domain/repository/profiles_repository.dart';

class GetProfilesUsecase
    extends UseCase<DataState<List<ProfileEntity>>, NoParam> {
  final ProfileRepository profileRepository;
  GetProfilesUsecase({
    required this.profileRepository,
  });
  @override
  Future<DataState<List<ProfileEntity>>> call(NoParam param) {
    return profileRepository.fetchProfiles();
  }
}
