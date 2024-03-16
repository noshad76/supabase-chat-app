import 'package:bloc/bloc.dart';
import 'package:chat_app/core/resources/data_state.dart';
import 'package:chat_app/core/usecase/no_params.dart';
import 'package:chat_app/features/contacts/domain/entity/profile_entity.dart';
import 'package:chat_app/features/contacts/domain/usecases/get_profiles_usecase.dart';
import 'package:equatable/equatable.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  GetProfilesUsecase getProfilesUsecase;
  ContactsBloc({required this.getProfilesUsecase}) : super(ContactsLoading()) {
    on<GetContacts>((event, emit) async {
      DataState<List<ProfileEntity>> dataState =
          await getProfilesUsecase(NoParam());

      if (dataState is DataSuccess) {
        emit(ContactsDone(profiles: dataState.data!));
      } else {
        emit(ContactsError(error: dataState.error!));
      }
    });
  }
}
